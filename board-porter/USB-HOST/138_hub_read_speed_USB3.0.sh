#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n*****************HUB READ SPEED USB3.0 TEST********************\n"

echo "Make sure insert USB device on USB HUB 2.0 and connect HUB to USB 2.0 lower port"
sleep 1

if ! ls /dev | grep ${DEVICE_USB3} > /dev/null 2>&1; then
	echo "Device not found.Please connect HUB to USB 3.0 port and test again."
	exit 1
fi

$(dirname $0)/usb_read_speed.sh $USB3_DIR $DEVICE_USB3_PART1

echo "\n***************************************************************\n"