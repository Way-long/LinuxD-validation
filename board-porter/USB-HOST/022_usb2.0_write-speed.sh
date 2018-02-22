#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n********************WRITE SPEED USB2.0 TEST********************\n"

if ! ls /dev | grep ${DEVICE_USB2C1} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 2.0 lower port and test again."
	exit 1
fi

$(dirname $0)/usb_write_speed.sh $USB2_DIR $DEVICE_USB2C1_PART1

echo "\n***************************************************************\n"