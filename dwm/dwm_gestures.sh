#!/bin/bash

# Check if DWM is running
if pgrep -x "dwm" >/dev/null; then
	# DWM is running, send the appropriate command
	echo "$2" >/tmp/dwm_command_fifo
fi
