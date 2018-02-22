#!/bin/sh
# usb function device driver autotest shell-script

set -a
#set -x

echo "\n*****************USB FUNCTION SERIAL SUSPEND TEST**************\n"

#modprobe device
$CMD_SSH <<ENDSSH

eval $PREPARE_SUSPEND
eval $CMD_SUSPEND &

ENDSSH

sleep 5

eval $CMD_RESUME

echo "BOARD => PC"

$(dirname $0)/004_usbfs_serial_board_to_pc.sh

sleep 5

echo "PC => BOARD"

$(dirname $0)/005_usbfs_serial_pc_to_board.sh

echo "\n***************************************************************\n"
