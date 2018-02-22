#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n****************DISPLAY IMAGE ON ${HDMI_NAME1} AFTER SUSPEND************\n"

$CMD_SSH <<ENDSSH

eval $PREPARE_SUSPEND

eval $CMD_SUSPEND &

ENDSSH

sleep 5

eval $CMD_RESUME

$CMD_SSH <<ENDSSH

exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_du.sh 004_du_ram_display_image_on_hdmi1.sh

ENDSSH

echo "\n************************************************************************\n"
