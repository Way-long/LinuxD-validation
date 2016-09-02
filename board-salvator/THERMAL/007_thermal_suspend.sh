#!/bin/sh
# thermal device driver autotest shell-script

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

exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_ethernet.sh 003_thermal_temperature_chip.sh

ENDSSH