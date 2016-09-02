#!/bin/sh
# usb device driver autotest shell-script

set -e
#set -x

# suspend system before setting date time
$CMD_SSH <<ENDSSH

eval $PREPARE_SUSPEND

eval $CMD_SUSPEND &

ENDSSH

sleep 5

eval $CMD_RESUME

$CMD_SSH <<ENDSSH

exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_ethernet.sh 013_usb2.0_write-RAM-to-USB_have_data_100MB.sh

ENDSSH