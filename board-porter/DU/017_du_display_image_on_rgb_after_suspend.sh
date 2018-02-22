#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n****************DISPLAY IMAGE ON ${RGB_NAME} AFTER SUSPEND**************\n"

$CMD_SSH <<ENDSSH

eval $PREPARE_SUSPEND

eval $CMD_SUSPEND &

ENDSSH

sleep 5

eval $CMD_RESUME

$CMD_SSH <<ENDSSH

exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_du.sh 005_du_ram_display_image_on_rgb.sh

ENDSSH

echo "\n************************************************************************\n"