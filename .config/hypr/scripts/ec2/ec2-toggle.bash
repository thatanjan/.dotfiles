#!/usr/bin/env bash
INSTANCE_ID="i-03ee02eb2519f41af"

# Get current instance state
STATE=$(aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --query "Reservations[0].Instances[0].State.Name" --output text)

if [ "$STATE" = "stopped" ]; then
	echo "Instance is stopped. Starting instance..."
	aws ec2 start-instances --instance-ids "$INSTANCE_ID"
elif [ "$STATE" = "running" ]; then
	echo "Instance is running. Stopping instance..."
	aws ec2 stop-instances --instance-ids "$INSTANCE_ID"
else
	echo "Instance is in '$STATE' state. Cannot toggle right now."
fi
