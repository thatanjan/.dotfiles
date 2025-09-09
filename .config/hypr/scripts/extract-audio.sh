#!/bin/bash

# --- Configuration ---
# Set the desired MP3 quality. 0 is highest, 9 is lowest.
# Values like 0, 1, or 2 are recommended for high quality.
MP3_QUALITY=0

# --- Script Logic ---

# Check if any arguments are provided (specific files)
if [ "$#" -gt 0 ]; then
  files_to_process=("$@")
else
  # If no arguments, process common video formats in the current directory
  echo "No specific files provided. Processing all .mp4, .mov, .avi files in the current directory..."
  files_to_process=(*.mp4 *.mov *.avi)
fi

echo "Starting video to MP3 conversion..."

for input_file in "${files_to_process[@]}"; do
  # Check if the file exists and is a regular file
  if [ -f "$input_file" ]; then
    # Extract filename without extension
    filename_no_ext="${input_file%.*}"
    # Construct the output filename
    output_file="${filename_no_ext}.mp3"

    echo "----------------------------------------------------"
    echo "Processing: $input_file"
    echo "Output: $output_file"

    # FFmpeg command to convert video to high-quality MP3
    # -i: input file
    # -vn: no video output
    # -acodec libmp3lame: use the LAME MP3 encoder
    # -q:a $MP3_QUALITY: Variable Bit Rate (VBR) quality. 0 is highest, 9 is lowest.
    ffmpeg -i "$input_file" -vn -acodec libmp3lame -q:a "$MP3_QUALITY" "$output_file"

    if [ $? -eq 0 ]; then
      echo "Successfully converted $input_file to $output_file"
    else
      echo "Error converting $input_file. Please check FFmpeg output for details."
    fi
  else
    echo "Skipping '$input_file': Not found or not a regular file."
  fi
done

echo "----------------------------------------------------"
echo "Conversion process finished."
