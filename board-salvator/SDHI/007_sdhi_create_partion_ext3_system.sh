#!/bin/bash
# sdhi device driver autotest shell-script

set -a
#set -x

#Creating partition and making file system for card 
echo "\n*********CREATING PARTITION AND MAKING FILE SYSTEM FOR SDHI*************\n"

for DEVICE in "$DEVICE_SD0" "$DEVICE_SD1"; 
do 

	if ls /dev/${DEVICE} | grep ${DEVICE} > /dev/null 2>&1; then
	
		echo "Creating partion for $DEVICE"
		( echo d; echo 1; echo d; echo 2; echo d; echo 3; echo d; echo n; echo p; echo 1; echo 2048; echo "+1500MB"; echo t; echo 83; echo w) | fdisk /dev/${DEVICE} > /dev/null 2>&1 

		echo "Make ext3 file system for $DEVICE"
		mkfs.ext3 /dev/${DEVICE}p1 > /dev/null 2>&1

		if [ ! -e "/dev/${DEVICE}p1" ]; then
		   echo "create partition FAILED\n"
		else
		   echo "create partition PASSED\n"	
		fi

	fi

done

echo "\n************************************************************************\n"