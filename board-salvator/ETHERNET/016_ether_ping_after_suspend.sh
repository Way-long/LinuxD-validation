#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

# suspend system before copy data
$CMD_SSH <<ENDSSH

eval $PREPARE_SUSPEND

eval $CMD_SUSPEND &

ENDSSH

sleep 5

eval $CMD_RESUME

$CMD_SSH <<ENDSSH

exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_ethernet.sh 004_ether_ping_network.sh

ENDSSH