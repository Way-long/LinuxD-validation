#!/bin/bash

set -e
#set -x

echo "USB FUNCTION STRESS CPU TEST"

$(dirname $0)/run_stress.sh & sleep 5

$(dirname $0)/usbfs_sd_store_copy_50time.sh

if [ "$?" -eq "0" ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi