#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n*********USB FUNCTION SD COPY 1GB FROM BOARD TO PC*********\n"

echo "Please insert SD card into CN14(SD3) before test this item."

sleep 5

# modprobe device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_modprobe.sh g_mass_storage file=/dev/mmcblk1p1

ENDSSH

sleep 5
if ! test -e $STORAGE_DEVICE_PC; then
        echo "$STORAGE_DEVICE_PC not exist on your PC(HOST) side."
        eval $FAIL_MEG
        exit 1
fi

sudo mount $STORAGE_DEVICE_PC $STORAGE_FOLDER

$(dirname $0)/usbfs_speed_copy_data.sh $STORAGE_FOLDER $PC_FOLDER 1024

sleep 2

sync
sudo umount $STORAGE_DEVICE_PC
#rmmod device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_rmmod.sh g_mass_storage

ENDSSH

echo "\n***********************************************************\n"
