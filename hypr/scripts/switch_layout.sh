#!/bin/bash

LAYOUT=$(hyprctl -j getoption general:layout | jq '.str' | sed 's/"//g')

case $LAYOUT in
"master")
	hyprctl keyword general:layout dwindle
	# hyprctl keyword unbind SUPER,J
	# hyprctl keyword unbind SUPER,K
	hyprctl keyword unbind SUPER,S
	# hyprctl keyword bind SUPER,J,cyclenext
	# hyprctl keyword bind SUPER,K,cyclenext,prev
	hyprctl keyword bind SUPER,S,layoutmsg,togglesplit
	notify-send -i "$HOME/.config/hypr/mako/icons/hyprland.png" "Layout" "Dwindle"
	;;
"dwindle")
	hyprctl keyword general:layout master
	# hyprctl keyword unbind SUPER,J
	# hyprctl keyword unbind SUPER,K
	hyprctl keyword unbind SUPER,S
	# hyprctl keyword bind SUPER,J,layoutmsg,cyclenext
	# hyprctl keyword bind SUPER,K,layoutmsg,cycleprev
	hyprctl keyword bind SUPER, S,layoutmsg,orientationnext
	notify-send -i "$HOME/.config/hypr/mako/icons/hyprland.png" "Layout" "Master"
	;;
*) ;;

esac
