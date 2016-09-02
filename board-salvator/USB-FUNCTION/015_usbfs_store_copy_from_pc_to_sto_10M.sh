#!/bin/bash

set -e
#set -x

echo "USB FUNCTION STORE GATAGET COPY"

#modprobe device
$CMD_SSH <<ENDSSH

mount -t tmpfs -o size=400m tmpfs /tmp

dd if=/dev/zero of=/tmp/tmp.img bs=1M count=350

yes | mkfs.ext3 -L storage /tmp/tmp.img

modprobe g_mass_storage file=/tmp/tmp.img

ENDSSH

#prepare storage memory
sleep 5 

mkdir -p $PC_FOLDER

dd if=/dev/urandom of=$PC_FOLDER/file-10m bs=1M count=10

cp $PC_FOLDER/file-10m $STORAGE_FOLDER

cmp $PC_FOLDER/file-10m $STORAGE_FOLDER/file-10m

if [ "$?" -eq "0" ]; then
	echo "TEST PASSED"
else
	echo "TEST FAILED"
	exit "$?"
fi

rm -rf $PC_FOLDER
rm -rf $STORAGE_FOLDER/*

#rmmod device
sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

rmmod g_mass_storage

umount /tmp

ENDSSH