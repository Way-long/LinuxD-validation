#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n************USB FUNCTION GADGET STORAGE SUSPEND TEST*******\n"

#modprobe device
$CMD_SSH <<ENDSSH

eval $PREPARE_SUSPEND
eval $CMD_SUSPEND &

ENDSSH

sleep 5

eval $CMD_RESUME

echo "COPY FROM BOARD => PC"

$(dirname $0)/016_usbfs_store_copy_from_pc_to_sto_100M.sh

sleep 5

echo "COPY FROM PC => BOARD"

$(dirname $0)/019_usbfs_store_copy_from_sto_to_pc_100M.sh

echo "\n***************************************************************\n"
