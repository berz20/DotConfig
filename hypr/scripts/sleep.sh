#!/bin/sh
swayidle \
                timeout 300 'temp=$(brightnessctl g); brightnessctl set $((temp / 2))' \
                    resume 'temp=$(brightnessctl g); brightnessctl set $((temp * 2))' \
                timeout 600 "swaylock & sleep 1 && hyprctl dispatch dpms off" \
                    resume 'hyprctl dispatch dpms on' \
                # timeout 660 'systemctl suspend'
