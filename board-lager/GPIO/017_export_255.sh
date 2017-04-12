#!/bin/sh
echo "export gpio port 255"

pin=255
if echo $pin > /sys/class/gpio/export; then
	echo $pin > /sys/class/gpio/unexport
	echo "\nFAILED"
else
	echo "\nPASSED"
fi
