#!/bin/sh
# usb function device driver autotest shell-script

set -a
#set -x

echo "\n*****************USB FUNCTION ETHER SUSPEND TEST***************\n"

#modprobe device
$CMD_SSH <<ENDSSH

eval $PREPARE_SUSPEND
eval $CMD_SUSPEND &

ENDSSH

sleep 5

eval $CMD_RESUME

echo "PING BOARD => PC"

$(dirname $0)/010_usbfs_ethernet_ping_board_pc.sh

sleep 5

echo "PING PC => BOARD"

$(dirname $0)/011_usbfs_ethernet_ping_pc_board.sh

echo "\n***************************************************************\n"