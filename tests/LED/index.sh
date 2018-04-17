#!/bin/sh
# this program is run in /root. Please login /root with 'su' command

set -e
#set -x
echo "This is program led to check led light up or led light off"

LEDS_NUM=0
if [ ! -f "/sys/class/leds/" ]; then
	echo "CONF: /sys/class/leds not exist."
	exit 1
else
	LEDS_NUM=ls /sys/class/leds/ | wc -l
fi

if [ $LEDS_NUM -gt 0 ]; then
	sleep 1
	for path in "/sys/class/leds/"*"/brightness" ;do
		echo "\n$path +ON"
		echo 1 > $path && echo "PASSED" || echo "FAILED"
		sleep 2
		echo "$path -OFF"
		echo 0 > $path && echo "PASSED" || echo "FAILED"
		sleep 2
	done
else
	echo "CONF: nothing exist in /sys/class/leds/."
fi
