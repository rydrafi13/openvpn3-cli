#!/bin/bash

# Check if both the profile name and credentials file were provided
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: ./start.sh <profile-name> <path-to-creds-file>"
    exit 1
fi

PROFILE_NAME="$1"
CRED_FILE="$2"

# Check if the credentials file actually exists
if [ ! -f "$CRED_FILE" ]; then
    echo "Error: Credentials file '$CRED_FILE' not found!"
    exit 1
fi

# "Source" the file to load the USERNAME and PASSWORD variables into this script
source "$CRED_FILE"

echo "Starting OpenVPN session for '$PROFILE_NAME' with user '$USERNAME'..."

# Pass the credentials securely using %s to avoid formatting errors with special characters
printf "%s\n%s\n" "$USERNAME" "$PASSWORD" | openvpn3 session-start --config "$PROFILE_NAME"
