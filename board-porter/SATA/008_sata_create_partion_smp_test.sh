#!/bin/bash
# sata device driver autotest shell-script

echo "\n*********CREATING PARTITION AND MAKING FILE SYSTEM FOR SATA*************\n"

set -e
#set -x

echo "Creating  partition 1 2 3 4 for SATA"
( echo d; echo 1; echo d; echo 2; echo d; echo 3; echo d; echo n; echo p; echo 1; echo 2048; echo "+1G"; echo t; echo 83; echo w) | fdisk /dev/sda > /dev/null 2>&1

echo "Make ext3 file system for partition 1"
mkfs.ext3 /dev/sda1 > /dev/null 2>&1

sleep 5

(echo n; echo p; echo 2; echo 2099200; echo "+1G"; echo t; echo 2; echo 83; echo w) | fdisk /dev/sda > /dev/null 2>&1
echo "Make ext3 file system for partition 2"
mkfs.ext3 /dev/sda2 > /dev/null 2>&1

sleep 5

(echo n; echo p; echo 3; echo 4196352; echo "+1G"; echo t; echo 2; echo 83; echo w) | fdisk /dev/sda > /dev/null 2>&1
echo "Make ext3 file system for partition 3"
mkfs.ext3 /dev/sda3 > /dev/null 2>&1

sleep 5

(echo n; echo p; echo 4; echo 6293504; echo "+1G"; echo t; echo 2; echo 83; echo w) | fdisk /dev/sda > /dev/null 2>&1
echo "Make ext3 file system for partition 4"
mkfs.ext3 /dev/sda4 > /dev/null 2>&1

for i in {1..4}
do
	if [ -e "/dev/sda${i}" ]; then
		if [ "$i" = "4" ] ; then
			eval $PASS_MEG
		fi	
	else
		echo "$i not exits"
		eval $FAIL_MEG
		break
	fi		

done

echo "\n************************************************************************\n"