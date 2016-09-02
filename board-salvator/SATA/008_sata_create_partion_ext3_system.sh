#!/bin/sh
# sata device driver autotest shell-script

echo "\n*********CREATING PARTITION AND MAKING FILE SYSTEM FOR SATA*************\n"

set -e
#set -x

echo "Creating  partition 1 and partition 2 for card"
( echo d; echo 1; echo d; echo 2; echo d; echo 3; echo d; echo n; echo p; echo 1; echo 2048; echo "+10G"; echo t; echo 83; echo w) | fdisk /dev/sda > /dev/null 2>&1

echo "Make ext3 file system for partition 1"
mkfs.ext3 /dev/sda1 > /dev/null 2>&1

sleep 5

(echo n; echo p; echo 2; echo 20973568; echo "+10G"; echo t; echo 2; echo 83; echo w) | fdisk /dev/sda > /dev/null 2>&1
echo "Make ext3 file system for partition 2"
mkfs.ext3 /dev/sda2 > /dev/null 2>&1

for i in {1..2}
do
	if [ -e "/dev/sda$i" ]; then
		if [ "$i" = "2" ] ; then
			eval $PASS_MEG
		fi	
	else
		eval $FAIL_MEG
		break
	fi		

done

echo "\n************************************************************************\n"
