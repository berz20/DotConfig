#!/bin/bash

# Check if NetworkManager is installed
if ! command -v nmcli &>/dev/null; then
	echo "NetworkManager (nmcli) is not installed on your system."
	exit 1
fi

# Check if NetworkManager is running
if [[ "$(nmcli general status | awk 'NR==2{print $1}')" == "connected" ]]; then
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "airplane-mode-symbolic" "Signals Off" "Airplane Mode"
	nmcli radio all off
else
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "airplane-mode-disabled-symbolic" "Signals On" "Airplane Mode"
	nmcli radio all on
fi
