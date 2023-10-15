#!/usr/bin/env bash

if [[ "$1" == "--toggle" ]]; then
  playerctl play-pause -p spotify; kill -52 $(pidof dwmblocks)
elif [[ "$1" == "--next" ]]; then
  playerctl next -p spotify; kill -52 $(pidof dwmblocks)
elif [[ "$1" == "--prev" ]]; then
  playerctl previous -p spotify; kill -52 $(pidof dwmblocks)
elif [[ "$1" == "--all" ]]; then
  playerctl play-pause -a; kill -52 $(pidof dwmblocks)

fi

