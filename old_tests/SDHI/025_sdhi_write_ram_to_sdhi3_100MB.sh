#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n************************WRITE DATA FROM RAM TO SDHI0********************\n"

$(dirname $0)/sdhi_copy_data.sh $RAM_DIR $SD2_DIR 100

echo "\n************************************************************************\n"