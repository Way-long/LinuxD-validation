#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n******************USB FUNCTION STRESS CPU TEST*************\n"

$(dirname $0)/run_stress.sh & sleep 5

START=`date +%s`

TEST_TIME=3600

while [ $(( $(date +%s) - $TEST_TIME )) -lt $START ]; do

#   echo "This test still need $(( $TEST_TIME - $(date +%s) + $START ))s."

    for i in $(seq 1 10);
	do

		echo "--- This test still need $(( $TEST_TIME - $(date +%s) + $START ))s. ---"

		$(dirname $0)/016_usbfs_store_copy_from_pc_to_sto_100M.sh

	done

done

echo "\n***********************************************************\n"
