#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n***************100 TIMES READ DATA FROM SDHI TO RAM************\n"

for i in $(seq 1 100);
do

	$(dirname $0)/sdhi_copy_data.sh $SD2_DIR $RAM_DIR 350

done

echo "\n***************************************************************\n"