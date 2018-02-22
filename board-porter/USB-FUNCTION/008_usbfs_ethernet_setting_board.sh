#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n**************USB FUNCTION ETHERNET SETTING ON BOARD***********\n"

#modprobe device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_modprobe.sh g_ether

ENDSSH

sleep 5

$CMD_SSH <<ENDSSH

exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_usbfs.sh usbfs_check_ethernet_on_board.sh

ENDSSH

sleep 2

#rmmod device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_rmmod.sh g_ether

ENDSSH

echo "\n***************************************************************\n"
