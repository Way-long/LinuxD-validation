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

        if ls /dev | grep ${DEVICE_USB2C1} > /dev/null 2>&1; then
			$(dirname $0)/usb_copy_data.sh $RAM_DIR $USB2_DIR 350
		else
			if ls /dev | grep ${DEVICE_USB2C2} > /dev/null 2>&1; then
				$(dirname $0)/usb_copy_data.sh $RAM_DIR $USB2_CH2_DIR 350
			else
				echo "Device not found.Please insert usb device on USB 2.0 upper or lower port and test again."
				exit 1
			fi
		fi

    done

done

echo "\n************************************************************************\n"