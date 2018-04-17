#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n***********************WRITE FOLDER FROM RAM TO USB3.0*******************\n"

if ! ls /dev | grep ${DEVICE_USB3} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 3.0 port and test again."
	exit 1
fi

$(dirname $0)/usb_copy_folder.sh $RAM_DIR $USB3_DIR 1 1

echo "\n************************************************************************\n"