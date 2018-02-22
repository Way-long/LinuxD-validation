#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n************************WRITE DATA FROM RAM TO SDHI0********************\n"

$(dirname $0)/sdhi_copy_data.sh $RAM_DIR $SD1_DIR 10

echo "\n************************************************************************\n"