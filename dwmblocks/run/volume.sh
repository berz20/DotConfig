#!/usr/bin/env bash

if [[ "$1" == "--toggle" ]]; then
  volume --toggle; kill -44 $(pidof dwmblocks)
elif [[ "$1" == "--inc" ]]; then
  volume --inc; kill -44 $(pidof dwmblocks)
elif [[ "$1" == "--dec" ]]; then
  volume --dec; kill -44 $(pidof dwmblocks)

fi

