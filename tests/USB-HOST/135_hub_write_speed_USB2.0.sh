#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n****************HUB WRITE SPEED USB2.0 TEST********************\n"

echo "Make sure insert USB device on USB HUB 2.0 and connect HUB to USB 2.0 lower port"
sleep 1

if ls /dev | grep ${DEVICE_USB2C1} > /dev/null 2>&1; then
	$(dirname $0)/usb_write_speed.sh $USB2_DIR $DEVICE_USB2C1_PART1
else
	if ls /dev | grep ${DEVICE_USB2C2} > /dev/null 2>&1; then
		$(dirname $0)/usb_write_speed.sh $USB2_CH2_DIR $DEVICE_USB2C2_PART1
	else
		echo "Device not found.Please connect HUB to USB 2.0 upper or lower port and test again."
		exit 1
	fi
fi

echo "\n***************************************************************\n"