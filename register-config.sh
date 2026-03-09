#!/bin/bash

# Check if the user provided BOTH the .ovpn file and the profile name
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Missing arguments."
    echo "Usage: ./register-config.sh <path-to-file.ovpn> <profile-name>"
    exit 1
fi

CONFIG_FILE="$1"
PROFILE_NAME="$2"

echo "Importing configuration profile '$CONFIG_FILE' as '$PROFILE_NAME'..."
openvpn3 config-import --config "$CONFIG_FILE" --name "$PROFILE_NAME" --persistent

echo "Profile '$PROFILE_NAME' successfully registered."
