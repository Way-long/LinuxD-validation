#!/bin/bash
# scif device driver autotest shell-script

set -e
#set -x

echo "stress scif driver autotest"

# Multiple cpu test

echo "Run with $CPU_NUMBER CPU"
echo "---------------------------------------------------------------------------"

sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

stress --cpu $CPU_NUMBER --io 8 --vm 4 --vm-bytes 20M --timeout 1200s &

$SHELL_SOURCE_CODE/$DRIVER_PATH/scif_ttysc0_discharge.sh 1200

ENDSSH
