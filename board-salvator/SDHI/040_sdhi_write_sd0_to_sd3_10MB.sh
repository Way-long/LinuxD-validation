#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n************************WRITE DATA INSIDE 2 SDHI*******************\n"

$(dirname $0)/sdhi_copy_data.sh $SD1_DIR $SD2_DIR 10

echo "\n*******************************************************************\n"