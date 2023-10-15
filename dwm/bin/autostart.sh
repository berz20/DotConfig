#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>
## Everyone is permitted to copy and distribute copies of this file under GNU-GPL3
## Autostart Programs

# Kill already running process
_ps=(picom dunst ksuperkey mpd xfce-polkit xfce4-power-manager)
for _prs in "${_ps[@]}"; do
	if [[ $(pidof ${_prs}) ]]; then
		killall -9 ${_prs}
	fi
done

# Fix cursor
xsetroot -cursor_name left_ptr

# Polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

# Enable power management
xfce4-power-manager &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Restore wallpaper
hsetroot -cover /home/berz/Pictures/wallpapers/nord-qsave-2.png
# variety &

# Lauch dwmbar
# /home/berz/.config/dwm/bin/dwmbar.sh &
dwmblocks &
# eww daemon &
# Lauch notification daemon
/home/berz/.config/dwm/bin/dwmdunst.sh

# Lauch compositor
/home/berz/.config/dwm/bin/dwmcomp.sh

# Start mpd
# exec mpd &

## Add your autostart programs here --------------

# Speedy keys
xset r rate 210 55
# select right keyboard
setxkbmap it
setxkbmap -variant us
setxkbmap -option caps:swapescape
setxkbmap it -variant intl

#define wm name
wmname LG3D &
## -----------------------------------------------

# Launch DWM
dwm
