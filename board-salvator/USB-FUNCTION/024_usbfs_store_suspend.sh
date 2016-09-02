#!/bin/bash

set -e
#set -x

echo "USB FUNCTION STORE GATAGET SUSPEND TEST"

#modprobe device
$CMD_SSH <<ENDSSH

mount -t tmpfs -o size=400m tmpfs /tmp

dd if=/dev/zero of=/tmp/tmp.img bs=1M count=350

yes | mkfs.ext3 -L storage /tmp/tmp.img

modprobe g_mass_storage file=/tmp/tmp.img

echo enabled > /sys/devices/platform/soc/e6e88000.serial/tty/ttySC0/power/wakeup
;;


echo mem > /sys/power/state

ENDSSH

#prepare storage memory
sleep 5 

mkdir -p $PC_FOLDER

dd if=/dev/urandom of=$PC_FOLDER/file-300m bs=1M count=300

cp $PC_FOLDER/file-300m $STORAGE_FOLDER

cmp $PC_FOLDER/file-300m $STORAGE_FOLDER/file-300m

if [ "$?" -eq "0" ]; then
	echo "TEST PASSED"
else
	echo "TEST FAILED"
	exit "$?"
fi

rm -rf $PC_FOLDER
rm -rf $STORAGE_FOLDER/*

#rmmod device
$CMD_SSH <<ENDSSH

rmmod g_mass_storage

umount /tmp

ENDSSH