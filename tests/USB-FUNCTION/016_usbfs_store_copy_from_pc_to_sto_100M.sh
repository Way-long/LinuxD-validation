#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n*********USB FUNCTION COPY 100MB FROM PC TO BOARD**********\n"

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

$(dirname $0)/usbfs_copy_data.sh $PC_FOLDER $STORAGE_FOLDER 100

sleep 2
sudo umount $STORAGE_DEVICE_PC

#rmmod device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_rmmod.sh g_mass_storage

umount /tmp

ENDSSH

echo "\n***********************************************************\n"
