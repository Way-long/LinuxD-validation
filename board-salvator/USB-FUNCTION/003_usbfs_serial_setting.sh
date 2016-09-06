#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n**********************USB FUNCTION SERIAL SETTING**************\n"

#modprobe device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_modprobe.sh g_serial

ENDSSH

sleep 5

cmd="ls /dev/ttyACM0"
echo $cmd

if ! $cmd | grep "ttyACM0";then
	eval $PASS_MEG
else	
	eval $FAIL_MEG
fi	

sleep 2

#rmmod device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_rmmod.sh g_serial

ENDSSH

echo "\n***************************************************************\n"