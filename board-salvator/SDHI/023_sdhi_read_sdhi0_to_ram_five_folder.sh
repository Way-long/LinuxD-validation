#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n***********************READ FOLDER FROM SDHI TO RAM*********************\n"

$(dirname $0)/sdhi_copy_folder.sh $SD1_DIR $RAM_DIR 5

echo "\n************************************************************************\n"