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

echo $PCPASSWORD | sudo chown ${PCNAME}:${PCNAME} /media/${PCNAME}/storage > /dev/null 2>&1

dd if=/dev/urandom of=$PC_FOLDER/file-500m bs=1M count=500

cp $PC_FOLDER/file-500m $STORAGE_FOLDER > $LOGFILE 2>&1

LOG=`cat $LOGFILE`

rm -rf $LOGFILE

if ! echo $LOG | grep "No space left on device";then  
	eval $FAIL_MEG
fi

eval $PASS_MEG

sleep 2

#rmmod device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_rmmod.sh g_mass_storage

umount /tmp

ENDSSH

echo "\n***********************************************************\n"