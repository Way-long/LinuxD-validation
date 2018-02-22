#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n***********************READ FOLDER FROM USB2.0 TO RAM********************\n"

if ! ls /dev | grep ${DEVICE_USB2C1} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 2.0 lower port and test again."
	exit 1
fi

$(dirname $0)/usb_copy_folder.sh $USB2_DIR $RAM_DIR 1

echo "\n************************************************************************\n"