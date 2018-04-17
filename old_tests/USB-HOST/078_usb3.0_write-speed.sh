#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n********************WRITE SPEED USB3.0 TEST********************\n"

if ! ls /dev | grep ${DEVICE_USB3} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 3.0 port and test again."
	exit 1
fi

$(dirname $0)/usb_write_speed.sh $USB3_DIR $DEVICE_USB3_PART1

echo "\n***************************************************************\n"