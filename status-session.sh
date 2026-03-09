#!/bin/bash

echo "Checking active OpenVPN 3 sessions..."
echo "------------------------------------------------"
openvpn3 sessions-list
echo "------------------------------------------------"

# Optional: Count how many active sessions there are
SESSION_COUNT=$(openvpn3 sessions-list | grep -c "Status:")

if [ "$SESSION_COUNT" -eq 0 ]; then
    echo "Status: No active VPN connections found."
else
    echo "Status: $SESSION_COUNT active connection(s) running."
fi
