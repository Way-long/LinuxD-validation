#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n*************SIMULATANEOUSLY COPY USB2.0 AND USB3.0************\n"

if ! ls /dev | grep ${DEVICE_USB3} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 3.0 port and test again."
	exit 1
fi

if ls /dev | grep ${DEVICE_USB2C1} > /dev/null 2>&1; then
	$(dirname $0)/usb_simultaneously_copy_inside_two_usb.sh $USB2_DIR $USB3_DIR 100
else
	if ls /dev | grep ${DEVICE_USB2C2} > /dev/null 2>&1; then
		$(dirname $0)/usb_simultaneously_copy_inside_two_usb.sh $USB2_CH2_DIR $USB3_DIR 100
	else
		echo "Device not found.Please insert usb device on USB 2.0 upper or lower port and test again."
		exit 1
	fi
fi

echo "\n***************************************************************\n"