#!/bin/bash
# scif device driver autotest shell-script

set -e
#set -x

sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

taskset -c 0 $(dirname $0)/scif_ttysc0_rx.sh &
taskset -c 1 $(dirname $0)/scif_ttysc0_tx.sh

ENDSSH

#---------------test MSP-------------------


 



