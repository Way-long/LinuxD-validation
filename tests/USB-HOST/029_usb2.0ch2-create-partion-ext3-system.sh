#!/bin/bash
# usb device driver autotest shell-script

set -a
#set -x

#Creating partition and making file system for card 
echo "\n*********CREATING PARTITION AND MAKING FILE SYSTEM FOR USB 2.0 ch1*****\n"

if ! ls /dev | grep ${DEVICE_USB2C2} > /dev/null 2>&1; then
	echo "Device not found.Please insert usb device on USB 2.0 upper port and test again."
	exit 1
fi

$(dirname $0)/usb_create_partition.sh $DEVICE_USB2C2	

echo "\n***********************************************************************\n"