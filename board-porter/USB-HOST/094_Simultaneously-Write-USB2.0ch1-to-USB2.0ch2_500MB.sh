#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n********************SIMULATANEOUSLY COPY 2 USB2.0**************\n"

if ! ls /dev | grep ${DEVICE_USB2C1} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 2.0 lower port and test again."
	exit 1
fi

if ! ls /dev | grep ${DEVICE_USB2C2} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 2.0 upper port and test again."
	exit 1
fi

$(dirname $0)/usb_simultaneously_copy_inside_two_usb.sh $USB2_DIR $USB2_CH2_DIR 500

echo "\n***************************************************************\n"