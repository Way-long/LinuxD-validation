#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n*********************READ SPEED USB2.0 TEST********************\n"

if ! ls /dev | grep ${DEVICE_USB2C2} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 2.0 upper port and test again."
	exit 1
fi

$(dirname $0)/usb_read_speed.sh $USB2_CH2_DIR $DEVICE_USB2C2_PART1

echo "\n***************************************************************\n"