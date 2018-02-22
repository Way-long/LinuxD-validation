#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n************USB FUNCTION SERIAL TEST FROM PC TO BOARD**********\n"

#modprobe device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_modprobe.sh g_serial

ENDSSH

sleep 5

$(dirname $0)/listen_from_board.sh & $(dirname $0)/input_from_pc.sh 

sleep 2

#rmmod device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_rmmod.sh g_serial

ENDSSH

echo "\n***************************************************************\n"