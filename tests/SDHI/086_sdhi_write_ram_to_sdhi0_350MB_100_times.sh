#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n**************100 TIMES WRITE DATA FROM RAM TO SDHI0***********\n"

for i in $(seq 1 100);
do

	$(dirname $0)/sdhi_copy_data.sh $RAM_DIR $SD1_DIR 350

done

echo "\n***************************************************************\n"