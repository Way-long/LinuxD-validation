#!/bin/bash
# usb function device driver autotest shell-script

set -a
#set -x

echo "\n*****************USB FUNCTION CHECK LEFT SPACE*************\n"

# prepare and modprobe device
$CMD_SSH <<ENDSSH

mount -t tmpfs -o size=400m tmpfs /tmp

dd if=/dev/zero of=/tmp/tmp.img bs=1M count=350

yes | mkfs.ext3 -L storage /tmp/tmp.img

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_modprobe.sh g_mass_storage file=/tmp/tmp.img

ENDSSH

sleep 5

if ! test -e $STORAGE_DEVICE_PC; then
        echo "$STORAGE_DEVICE_PC not exist on your PC(HOST) side."
        eval $FAIL_MEG
        exit 1
fi

sudo mount $STORAGE_DEVICE_PC $STORAGE_FOLDER

echo "preparing 500M test data on PC(HOST) side."
dd if=/dev/urandom of=$PC_FOLDER/file-500m bs=1M count=500

echo "copy 500M data to the target board."
cp $PC_FOLDER/file-500m $STORAGE_FOLDER > $LOGFILE 2>&1

LOG=`cat $LOGFILE`

rm -rf $LOGFILE

if ! echo $LOG | grep "No space left on device";then  
	eval $FAIL_MEG
fi

echo "copy failed as expected."
eval $PASS_MEG

sleep 2
umount $STORAGE_DEVICE_PC

#rmmod device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_rmmod.sh g_mass_storage

umount /tmp

ENDSSH

echo "\n***********************************************************\n"
