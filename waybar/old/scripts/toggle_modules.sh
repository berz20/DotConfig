#!/bin/bash

config_file="$HOME/.config/waybar/config.jsonc"

if grep -q '"custom/memory",' "$config_file"; then
	# Temperature, memory, and CPU modules are present, remove them
	sed -i '/"temperature",/ s/^.*$//; /^$/d' "$config_file"
	sed -i '/"custom\/memory",/ s/^.*$//; /^$/d' "$config_file"
	sed -i '/"cpu",/ s/^.*$//; /^$/d' "$config_file"
else
	# Temperature, memory, and CPU modules are not present, add them
	sed -i '/"clock",/a\ \ \ \ \ \ \ \ "temperature",' "$config_file"
	sed -i '/"clock",/a\ \ \ \ \ \ \ \ "cpu",' "$config_file"
	sed -i '/"clock",/a\ \ \ \ \ \ \ \ "custom\/memory",' "$config_file"
fi

# Reload Waybar by sending the SIGUSR1 signal to the Waybar process
# pkill -SIGUSR1 waybar
