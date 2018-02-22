#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n********************HUB WRITE DATA FROM RAM TO USB2.0*******************\n"

echo "Make sure insert USB device on USB HUB 2.0 and connect HUB to USB 2.0 lower port"
sleep 1

if ls /dev | grep ${DEVICE_USB2C1} > /dev/null 2>&1; then
	$(dirname $0)/usb_copy_data.sh $RAM_DIR $USB2_DIR 10
else
	if ls /dev | grep ${DEVICE_USB2C2} > /dev/null 2>&1; then
		$(dirname $0)/usb_copy_data.sh $RAM_DIR $USB2_CH2_DIR 10
	else
		echo "Device not found.Please connect HUB to USB 2.0 upper or lower port and test again."
		exit 1
	fi
fi

echo "\n************************************************************************\n"