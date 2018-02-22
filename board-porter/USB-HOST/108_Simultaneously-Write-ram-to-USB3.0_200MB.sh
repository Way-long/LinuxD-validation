#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n*****************SIMULATANEOUSLY COPY RAM TO USB2.0************\n"

if ! ls /dev | grep ${DEVICE_USB3} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 3.0 port and test again."
	exit 1
fi

$(dirname $0)/usb_simultaneously_copy_inside_two_usb.sh $RAM_DIR $USB2_DIR 200

echo "\n***************************************************************\n"