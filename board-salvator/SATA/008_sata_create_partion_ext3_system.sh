#!/bin/bash
# sata device driver autotest shell-script

echo "\n*********CREATING PARTITION AND MAKING FILE SYSTEM FOR SATA*************\n"

set -e
#set -x

echo "Creating  partition 1 and partition 2 for card"
( echo d; echo 1; echo d; echo 2; echo d; echo 3; echo d; echo n; echo p; echo 1; echo 2048; echo "+10G"; echo t; echo 83; echo w) | fdisk /dev/$DEVICE_SATA > /dev/null 2>&1

echo "Make ext3 file system for partition 1"
mkfs.ext3 /dev/${DEVICE_SATA}1 > /dev/null 2>&1

sleep 5

(echo n; echo p; echo 2; echo 20973568; echo "+10G"; echo t; echo 2; echo 83; echo w) | fdisk /dev/$DEVICE_SATA > /dev/null 2>&1
echo "Make ext3 file system for partition 2"
mkfs.ext3 /dev/${DEVICE_SATA}2 > /dev/null 2>&1

for ((  i = 1 ;  i <= 2;  i++  ))
do
	if [ -e "/dev/${DEVICE_SATA}$i" ]; then
		if [ "$i" = "2" ] ; then
			eval $PASS_MEG
		fi	
	else
		echo "${DEVICE_SATA}$i not exits"
		eval $FAIL_MEG
		break
	fi		

done

echo "\n************************************************************************\n"
