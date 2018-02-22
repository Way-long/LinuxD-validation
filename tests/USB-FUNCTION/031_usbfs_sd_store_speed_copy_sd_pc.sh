#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n*****USB FUNCTION SD SPEED COPY 100MB FROM PC TO BOARD*****\n"

echo "Please insert SD card into CN14(SD3) before test this item."

sleep 5

# modprobe device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_modprobe.sh g_mass_storage file=/dev/mmcblk1p1

ENDSSH

sleep 5

MOUNT=`df | tail -n1`
SD_DIR=`echo "${MOUNT##* }"`

#check device existed.
if ! [ -d $SD_DIR ];then
	echo "SD card not found"
	eval $FAIL_MEG
	exit 1
fi

echo $PCPASSWORD | sudo chmod 777 $SD_DIR > /dev/null 2>&1

$(dirname $0)/usbfs_speed_copy_data.sh $SD_DIR $PC_FOLDER 100

sleep 2

rm -rf $SD_DIR/*

#rmmod device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_rmmod.sh g_mass_storage

umount /tmp

ENDSSH

echo "\n***********************************************************\n"