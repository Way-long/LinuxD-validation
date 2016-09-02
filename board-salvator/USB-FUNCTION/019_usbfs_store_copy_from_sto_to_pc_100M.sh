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

dd if=/dev/urandom of=$STORAGE_FOLDER/file-100m bs=1M count=100

cp $STORAGE_FOLDER/file-100m $PC_FOLDER

cmp $STORAGE_FOLDER/file-100m $PC_FOLDER/file-100m

if [ "$?" -eq "0" ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

rm -rf $PC_FOLDER
rm -rf $STORAGE_FOLDER/*

#rmmod device
$CMD_SSH <<ENDSSH

rmmod g_mass_storage

umount /tmp

ENDSSH