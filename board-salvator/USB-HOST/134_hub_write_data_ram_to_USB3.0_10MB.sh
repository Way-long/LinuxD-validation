#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n********************HUB WRITE DATA FROM RAM TO USB3.0*******************\n"

echo "Make sure insert USB device on USB HUB 3.0 and connect HUB to USB 3.0 port"
sleep 1

if ! ls /dev | grep ${DEVICE_USB3} > /dev/null 2>&1; then
	echo "Device not found.Please connect HUB to USB 3.0 port and test again."
	exit 1
fi

$(dirname $0)/usb_copy_data.sh $RAM_DIR $USB3_DIR 10

echo "\n************************************************************************\n"