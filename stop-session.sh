#!/bin/bash

# Check if the profile name was provided as an argument
if [ -z "$1" ]; then
    echo "Error: Profile name missing."
    echo "Usage: ./3-stop.sh <profile-name>"
    echo "Tip: Use ./4-list-configs.sh to see available names."
    exit 1
fi

PROFILE_NAME="$1"

echo "Attempting to disconnect session for profile: $PROFILE_NAME..."

# The --disconnect flag tells the session manager to shut down the tunnel
openvpn3 session-manage --config "$PROFILE_NAME" --disconnect

if [ $? -eq 0 ]; then
    echo "Successfully requested disconnection for '$PROFILE_NAME'."
else
    echo "Error: Failed to disconnect. Is the session actually running?"
fi
