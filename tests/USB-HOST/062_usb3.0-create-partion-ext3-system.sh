#!/bin/bash
# usb device driver autotest shell-script

set -a
#set -x

#Creating partition and making file system for card 
echo "\n*********CREATING PARTITION AND MAKING FILE SYSTEM FOR USB*************\n"

if ! ls /dev | grep ${DEVICE_USB3} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 3.0 port and test again."
	exit 1
fi

$(dirname $0)/usb_create_partition.sh $DEVICE_USB3	

echo "\n***********************************************************************\n"