#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n******************USB FUNCTION STRESS CPU TEST*************\n"

$(dirname $0)/run_stress.sh & sleep 5

START=`date +%s`

while [ $(( $(date +%s) - 3600 )) -lt $START ]; do

    for i in $(seq 1 100);
	do

		$(dirname $0)/016_usbfs_store_copy_from_pc_to_sto_100M.sh

	done

done

echo "\n***********************************************************\n"