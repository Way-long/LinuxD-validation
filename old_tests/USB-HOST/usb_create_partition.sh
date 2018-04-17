#!/bin/bash
# usb-host device driver autotest shell-script

set -a
#set -x

if [ $# -lt 1 ]; then
    echo "usage : $(basename $0) USB_DEVICE"
    exit 1
fi

USB_DEVICE="$1"

for DEVICE in "$USB_DEVICE";
do 

	if ls /dev | grep ${DEVICE} > /dev/null 2>&1; then
	
		echo "Creating partion for $DEVICE"
		( echo d; echo 1; echo d; echo 2; echo d; echo 3; echo d; echo n; echo p; echo 1; echo 2048; echo "+1500MB"; echo t; echo 83; echo w) | fdisk /dev/${DEVICE} > /dev/null 2>&1 

		echo "Make ext3 file system for $DEVICE"
		mkfs.ext3 /dev/${DEVICE}1 > /dev/null 2>&1

		if [ ! -e "/dev/${DEVICE}1" ]; then
		   eval $FAIL_MEG
		else
		   eval $PASS_MEG
		fi

	fi

done