#!/bin/sh
# usb device driver autotest shell-script

set -e
#set -x

#Creating partition and making file system for card 
echo "\n*********CREATING PARTITION AND MAKING FILE SYSTEM FOR USB*************\n"


echo "Creating  partion 1 and partion 2 for card"
( echo d; echo 1; echo d; echo 2; echo d; echo 3; echo d; echo n; echo p; echo 1; echo 2048; echo "+1500M"; echo t; echo 83; echo w) | fdisk $DEVICE_USB > /dev/null 2>&1

echo "Make ext3 file system for partion 1"
mkfs.ext3 ${DEVICE_USB}1 > /dev/null 2>&1

sleep 5

(echo n; echo p; echo 2; echo 3074048; echo "+500M"; echo t; echo 2; echo 83; echo w) | fdisk ${DEVICE_USB} > /dev/null 2>&1
echo "Make ext3 file system for partion 2"
mkfs.ext3 ${DEVICE_USB}2 > /dev/null 2>&1

sleep 5

(echo n; echo p; echo 3; echo 4098048; echo "+500M"; echo t; echo 3; echo 83; echo w) | fdisk ${DEVICE_USB} > /dev/null 2>&1
echo "Make ext3 file system for partion 3"
mkfs.ext3 ${DEVICE_USB}3 > /dev/null 2>&1

for ((  i = 1 ;  i <= 3;  i++  ))
do
	if [ -e "/dev/sda$i" ]; then
		if [ "$i" = "3" ] ; then
			echo "CREATE PARTITION SUCCESS"
		fi	
	else
		echo "CREATE PARTITION FAILED"
		break
	fi		

done

echo "\n***********************************************************************\n"