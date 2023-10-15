#!/usr/bin/env bash

if [[ "$1" == "--inc" ]]; then
  xbacklight -inc 3; kill -45 $(pidof dwmblocks)
elif [[ "$1" == "--dec" ]]; then
  xbacklight -dec 3; kill -45 $(pidof dwmblocks)

fi


