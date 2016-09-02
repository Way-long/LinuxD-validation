#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

#Creating partition and making file system for card 
echo "\n*********CREATING PARTITION AND MAKING FILE SYSTEM FOR SDHI*************\n"

echo "Creating  partion 1 card"
( echo d; echo 1; echo d; echo 2; echo d; echo 3; echo d; echo n; echo p; echo 1; echo 2048; echo "+1500MB"; echo t; echo 83; echo w) | fdisk $DEVICE_SD2 > /dev/null 2>&1 

echo "Make ext3 file system for partion 1"
mkfs.ext3 ${DEVICE_SD2}p1 > /dev/null 2>&1

if [ ! -e "${DEVICE_SD2}p1" ]; then
   echo "create partition FAILED"
   
else
   echo "create partition PASSED"	
fi

echo "\n************************************************************************\n"