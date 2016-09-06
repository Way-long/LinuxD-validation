#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

cmd="cat /dev/ttyGS0 >> $LOGFILE"
echo $cmd

$CMD_SSH <<ENDSSH

eval $cmd & sleep 5

exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_usbfs.sh usbfs_check_serial_on_board.sh

ENDSSH
