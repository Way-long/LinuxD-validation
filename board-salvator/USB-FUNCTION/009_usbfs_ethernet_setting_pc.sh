#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n**************USB FUNCTION ETHERNET SETTING ON PC**************\n"

#modprobe device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_modprobe.sh g_ether

ENDSSH

sleep 5

echo "ON PC:"

if ifconfig -a | grep $USBFS_ETHER_INTERFACE;then
	eval $PASS_MEG
else	
    eval $FAIL_MEG
fi

sleep 2

#rmmod device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_rmmod.sh g_ether

ENDSSH

echo "\n***************************************************************\n"