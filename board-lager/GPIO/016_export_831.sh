#!/bin/sh
echo "export gpio port 831"

pin=831
if echo $pin > /sys/class/gpio/export; then
	echo $pin > /sys/class/gpio/unexport
	echo "\nFAILED"
else
	echo "\nPASSED"
fi
