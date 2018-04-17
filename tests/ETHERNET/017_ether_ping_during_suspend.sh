#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

if [ "$RUNNING_FROM_PC" -eq "1" ]; then

$CMD_SSH <<ENDSSH
eval $PREPARE_SUSPEND &
eval $CMD_SUSPEND &
ENDSSH

    sleep 5
    eval $CMD_RESUME

$CMD_SSH <<ENDSSH
    exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_ethernet.sh 017_ether_ping_during_suspend.sh
ENDSSH

else
#    eval $CMD_SUSPEND &
    if ping -c 20 -I $INTERFACE $GOOGLE; then
        eval $PASS_MEG
    else
        eval $FAIL_MEG
    fi

fi
