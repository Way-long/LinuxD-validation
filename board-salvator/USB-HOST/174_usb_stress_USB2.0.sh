#!/bin/sh
# usb device driver autotest shell-script

set -e
#set -x

echo "\n************************** STRESS CPU TEST *****************************\n"

stress --cpu $CPU_NUMBER --io $(($CPU_NUMBER + $CPU_NUMBER)) --vm $CPU_NUMBER --vm-bytes 20M --timeout 3600s &

START=`date +%s`

while [ $(( $(date +%s) - 3600 )) -lt $START ]; do

    for i in $(seq 1 100);
    do

        $(dirname $0)/usb_copy_data.sh $RAM_DIR $USB2_DIR 350

    done

done

echo "\n************************************************************************\n"