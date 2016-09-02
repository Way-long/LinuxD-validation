#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n************************** STRESS CPU TEST *****************************\n"

stress --cpu $CPU_NUMBER --io $(($CPU_NUMBER + $CPU_NUMBER)) --vm $CPU_NUMBER --vm-bytes 20M --timeout 1800s &

START=`date +%s`

while [ $(( $(date +%s) - 3600 )) -lt $START ]; do

    $(dirname $0)/ftp_put_board_to_pc_data.sh 100

done

echo "\n************************************************************************\n"