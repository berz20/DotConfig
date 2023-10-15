#!/bin/bash
for n in $(wmctrl -l | awk $2 '!/-1/ {print $1}')
do
    wmctrl -i -c $n;
done
