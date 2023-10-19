#!/bin/bash

if grep open /proc/acpi/button/lid/LID0/state; then
	hyprctl keyword monitor "eDP-1, preferred, auto, 1"
else
	if [[ $(hyprctl monitors | grep "Monitor" | wc -l) != 1 ]]; then
		hyprctl keyword monitor "eDP-1, disable"
	else
		swaylock -f
		sleep 10
		systemctl suspend

	fi
fi
