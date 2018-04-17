#!/bin/bash
# scif device driver autotest shell-script

set -e
#set -x

sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

taskset -c 0 $SHELL_SOURCE_CODE/$DRIVER_PATH/scif_ttysc0_rx.sh &
taskset -c 1 $SHELL_SOURCE_CODE/$DRIVER_PATH/scif_ttysc0_tx.sh 120

ENDSSH

#---------------test MSP-------------------


 



