#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n***********************SUSPEND WHILE APLAY FILE*************************\n"

$CMD_SSH <<ENDSSH

eval $PREPARE_SUSPEND

eval $CMD_SUSPEND &

ENDSSH

sleep 5

eval $CMD_RESUME

$CMD_SSH <<ENDSSH

exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_sound.sh 004_sound_aplay_file.sh

ENDSSH

echo "\n***********************SUSPEND WHILE APLAY FILE*************************\n"
