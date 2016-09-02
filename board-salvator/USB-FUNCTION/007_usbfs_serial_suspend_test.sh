#!/bin/bash

set -e
#set -x

echo "USB FUNCTION SERIAL TEST"

#modprobe device
$CMD_SSH <<ENDSSH

echo enabled > /sys/devices/platform/soc/e6e88000.serial/tty/ttySC0/power/wakeup
;;

echo mem > /sys/power/state

ENDSSH

sleep 2

echo "BOARD => PC"

$(dirname $0)/usbfs_serial_board_to_pc.sh

sleep 5

echo "PC => BOARD"

$(dirname $0)/usbfs_serial_pc_to_board.sh

