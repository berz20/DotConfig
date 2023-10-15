#!/usr/bin/bash

interval=0

## Cpu Info
cpu_info() {
	read -r cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
	sleep 0.5
	read -r cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
	printf "^c#3b414d^ ^b#7ec7a2^ "
	printf "^c#abb2bf^ ^b#353b45^ $cpu%%"
}

## Memory
memory() {
	printf "^c#C678DD^^b#1e222a^   $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g) "
}

## Wi-fi
wlan() {
	case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
		up) printf "^c#3b414d^^b#7aa2f7^  ^d^%s" " ^c#7aa2f7^Connected " ;;
		down) printf "^c#3b414d^^b#E06C75^ 睊 ^d^%s" " ^c#E06C75^Disconnected " ;;
	esac
}

## Time
clock() {
 	dte=$(date '+%a, %D')
	time=$(date +"%H:%M")

	printf "^c#1e222a^^b#668ee3^  ^d^%s"
	printf " ^c#7aa2f7^$dte "
	printf "^c#1e222a^^b#7aa2f7^ $time "
}

## System Update
updates() {
	updates=$(checkupdates | wc -l)

	if [ -z "$updates" ]; then
		printf "^c#98C379^  Updated"
	else
		printf "^c#98C379^  $updates"" updates"
	fi
}

## Battery Info
battery() {
	BAT=$(upower -i `upower -e | grep 'BAT'` | grep 'percentage' | cut -d':' -f2 | tr -d '%,[:blank:]')
	AC=$(upower -i `upower -e | grep 'BAT'` | grep 'state' | cut -d':' -f2 | tr -d '[:blank:]')

	if [[ "$AC" == "charging" ]]; then
		printf "^c#E49263^^b#1e222a^   $BAT%%"
	elif [[ "$AC" == "fully-charged" ]]; then
		printf "^c#E06C75^^b#1e222a^   Full"
	else
		if [[ ("$BAT" -ge "0") && ("$BAT" -le "20") ]]; then
			printf "^c#E98CA4^^b#1e222a^   $BAT%%"
		elif [[ ("$BAT" -ge "20") && ("$BAT" -le "40") ]]; then
			printf "^c#E98CA4^^b#1e222a^   $BAT%%"
		elif [[ ("$BAT" -ge "40") && ("$BAT" -le "60") ]]; then
			printf "^c#E98CA4^^b#1e222a^   $BAT%%"
		elif [[ ("$BAT" -ge "60") && ("$BAT" -le "80") ]]; then
			printf "^c#E98CA4^^b#1e222a^   $BAT%%"
		elif [[ ("$BAT" -ge "80") && ("$BAT" -le "100") ]]; then
			printf "^c#E98CA4^^b#1e222a^   $BAT%%"
		fi
	fi
}

## Brightness
brightness() {
	LIGHT=$(printf "%.0f\n" `light -G`)

	if [[ ("$LIGHT" -ge "0") && ("$LIGHT" -le "25") ]]; then
		printf "^c#E5C07B^  $LIGHT%%"
	elif [[ ("$LIGHT" -ge "25") && ("$LIGHT" -le "50") ]]; then
		printf "^c#E5C07B^  $LIGHT%%"
	elif [[ ("$LIGHT" -ge "50") && ("$LIGHT" -le "75") ]]; then
		printf "^c#E5C07B^  $LIGHT%%"
	elif [[ ("$LIGHT" -ge "75") && ("$LIGHT" -le "100") ]]; then
		printf "^c#E5C07B^  $LIGHT%%"
	fi
}
## Volume
volume() {
	muted=$(pactl list sinks | awk '/Mute:/ { print $2 }')
	vol=$(pactl list sinks | grep Volume: | awk 'FNR == 1 { print $5 }' | cut -f1 -d '%')

	if [ "$muted" = "yes" ]; then
		echo "^c#E06C75^  muted"
	else
		if [ "$vol" -ge 45 ]; then
			printf "^c#56B6C2^  $vol%%"
		elif [ "$vol" -ge 15 ]; then
			printf "^c#56B6C2^  $vol%%"
		elif [ "$vol" -ge 0 ]; then
		  printf "^c#56B6C2^  $vol%%"
		fi
	fi
}
## Spotify
dwm_spotify () {
    if ps -C spotify > /dev/null; then
        ARTIST=$(playerctl -p spotify metadata artist)
        TRACK=$(playerctl -p spotify metadata title)
        DURATION=$(playerctl -p spotify metadata mpris:length | sed 's/.\{6\}$//')
        STATUS=$(playerctl -p spotify status)
        ALL="${ARTIST:0:11} - ${TRACK:0:18}"
	      printf "^c#3b414d^ ^b#7ec7a2^ "
	      printf "^c#abb2bf^ ^b#353b45^ $ALL"
    fi
}
## Main
while true; do
  [ "$interval" == 0 ] || [ $(("$interval" % 3600)) == 0 ] && updates=$(updates)
  interval=$((interval + 1))

  sleep 5 && xsetroot -name "$(dwm_spotify) $(battery) $(brightness) $(volume) $(cpu_info) $(memory) $(wlan) $(clock)"
done
