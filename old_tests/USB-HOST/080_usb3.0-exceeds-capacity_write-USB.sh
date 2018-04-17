#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n***********************EXCEEDS CAPACITY WRITE**********************\n"

if ! ls /dev | grep ${DEVICE_USB3} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 3.0 port and test again."
	exit 1
fi

$(dirname $0)/usb_exceeds_capacity_write.sh $USB3_DIR

echo "\n*******************************************************************\n"