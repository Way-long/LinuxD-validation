#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n********************HDD WRITE DATA USB3.0 to USB2.0*********************\n"

echo "Make sure inserted hard disk(SATA) via SATA-USB transfer port to USB 2.0 lower port"
sleep 1

if ! ls /dev | grep ${DEVICE_USB3} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 3.0 port and test again."
	exit 1
fi

if ls /dev | grep ${DEVICE_USB2C1} > /dev/null 2>&1; then
	$(dirname $0)/usb_copy_data.sh $USB3_DIR $USB2_DIR 1024
else
	if ls /dev | grep ${DEVICE_USB2C2} > /dev/null 2>&1; then
		$(dirname $0)/usb_copy_data.sh $USB3_DIR $USB2_CH2_DIR 1024
	else
		echo "Device not found.Please hard disk(SATA) via SATA-USB transfer port to USB 2.0 upper or lower port and test again."
		exit 1
	fi
fi

echo "\n************************************************************************\n"