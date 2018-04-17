#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

# $CMD_SSH <<ENDSSH

# eval $PREPARE_SUSPEND

# eval $CMD_SUSPEND &

# ENDSSH

# sleep 5

# eval $CMD_RESUME

$CMD_SSH <<ENDSSH

exec $SHELL_SOURCE_CODE/$DRIVER_PATH/sata_copy_data.sh $RAM_DIR $HDD_DIR 100 1

ENDSSH
