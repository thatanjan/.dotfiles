#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Configuration Section ---
USERNAME="anjan"

# An array of partition labels to be mounted.
# Using only the labels specified by the user.
PARTITION_LABELS=("kc3000" "970evo")

# Get the current user's UID and GID for correct ownership.
USER_UID=$(id -u)
USER_GID=$(id -g)

# The file system type for the Windows partitions.
FS_TYPE="ntfs-3g"

# --- Cleanup Logic (To ensure a clean start) ---
echo "--- Starting cleanup of old configurations ---"
for LABEL in "${PARTITION_LABELS[@]}"; do
  # Create a consistent hyphenated name for the unit files and mount points.
  HYPHENATED_LABEL=$(echo "$LABEL" | tr ' ' '-')
  UNIT_NAME="run-media-${USERNAME}-${HYPHENATED_LABEL}"
  MOUNT_PATH="/run/media/${USERNAME}/${HYPHENATED_LABEL}"

  # Disable and stop any existing services. The '|| true' prevents the script from exiting if the service doesn't exist.
  sudo systemctl disable --now "${UNIT_NAME}.automount" || true

  # Remove the unit files.
  sudo rm -f "/etc/systemd/system/${UNIT_NAME}.mount"
  sudo rm -f "/etc/systemd/system/${UNIT_NAME}.automount"

  # Remove the mount directory if it exists and is empty.
  sudo rmdir "$MOUNT_PATH" || true
done

# We should also clean up the unwanted label's configuration from the previous run
# This ensures that "Local Disk 970 evo" is not configured.
UNWANTED_LABEL="Local Disk 970 evo"
HYPHENATED_UNWANTED_LABEL=$(echo "$UNWANTED_LABEL" | tr ' ' '-')
UNWANTED_UNIT_NAME="run-media-${USERNAME}-${HYPHENATED_UNWANTED_LABEL}"
UNWANTED_MOUNT_PATH="/run/media/${USERNAME}/${HYPHENATED_UNWANTED_LABEL}"

sudo systemctl disable --now "${UNWANTED_UNIT_NAME}.automount" || true
sudo rm -f "/etc/systemd/system/${UNWANTED_UNIT_NAME}.mount"
sudo rm -f "/etc/systemd/system/${UNWANTED_UNIT_NAME}.automount"
sudo rmdir "$UNWANTED_MOUNT_PATH" || true

echo "--- Cleanup finished ---"

# --- Script Logic ---
echo "Starting systemd automount configuration script for user: $USERNAME"
echo "UID: $USER_UID, GID: $USER_GID"
echo "---"

# Loop through each partition label to create the necessary files.
for LABEL in "${PARTITION_LABELS[@]}"; do
  echo "Processing partition with label: '$LABEL'"

  # Create a consistent hyphenated name for the unit files and mount points.
  HYPHENATED_LABEL=$(echo "$LABEL" | tr ' ' '-')
  MOUNT_PATH="/run/media/${USERNAME}/${HYPHENATED_LABEL}"
  UNIT_NAME="run-media-${USERNAME}-${HYPHENATED_LABEL}"

  # Check if the partition exists.
  PARTITION_UUID=$(sudo blkid -L "$LABEL" || true)
  if [ -z "$PARTITION_UUID" ]; then
    echo "Error: Partition with label '$LABEL' not found. Skipping."
    continue
  fi

  # Create the mount point directory with hyphens.
  echo "Creating mount directory: '$MOUNT_PATH'"
  sudo mkdir -p "$MOUNT_PATH"

  # --- Create the .mount unit file ---
  MOUNT_FILE="/etc/systemd/system/${UNIT_NAME}.mount"
  echo "Creating mount unit file: '$MOUNT_FILE'"
  cat <<EOF | sudo tee "$MOUNT_FILE" >/dev/null
[Unit]
Description=Mount $LABEL Partition for $USERNAME

[Mount]
What=/dev/disk/by-label/$LABEL
Where=$MOUNT_PATH
Type=$FS_TYPE
Options=rw,uid=$USER_UID,gid=$USER_GID,umask=0022,fmask=0022,dmask=0022,utf8,nofail

EOF

  # --- Create the .automount unit file ---
  AUTOMOUNT_FILE="/etc/systemd/system/${UNIT_NAME}.automount"
  echo "Creating automount unit file: '$AUTOMOUNT_FILE'"
  cat <<EOF | sudo tee "$AUTOMOUNT_FILE" >/dev/null
[Unit]
Description=Automount $LABEL Partition for $USERNAME

[Automount]
Where=$MOUNT_PATH

[Install]
WantedBy=multi-user.target

EOF

  echo "Finished creating unit files for '$LABEL'."
  echo "---"
done

# Reload the systemd daemon to recognize the new unit files.
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

# Enable and start the new automount services.
echo "Enabling and starting automount services..."
for LABEL in "${PARTITION_LABELS[@]}"; do
  HYPHENATED_LABEL=$(echo "$LABEL" | tr ' ' '-')
  UNIT_NAME="run-media-${USERNAME}-${HYPHENATED_LABEL}"
  echo "Enabling service: $UNIT_NAME.automount"
  sudo systemctl enable --now "$UNIT_NAME.automount" || true
done

echo "---"
echo "All done! Your partitions should now be configured to automount."
echo "If the '970evo' partition still fails to mount, you'll need to fix the NTFS dirty flag."
