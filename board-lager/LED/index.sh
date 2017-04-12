#!/bin/sh

set -e
echo "This is program led to check led light up or led light off"
sleep 1
for path in "/sys/class/leds/"*"/brightness" ;do
	echo "\n+ON $path"
	echo 1 > $path && echo "PASSED" || echo "FAILED"
	sleep 2
	echo "-OFF $path"
	echo 0 > $path && echo "PASSED" || echo "FAILED"
	sleep 2
done