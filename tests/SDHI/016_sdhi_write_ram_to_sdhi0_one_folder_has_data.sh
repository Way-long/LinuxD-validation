#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n********************WRITE FOLDER FROM RAM TO SDHI******************\n"

$(dirname $0)/sdhi_copy_folder.sh $RAM_DIR $SD1_DIR 1 1

echo "\n*******************************************************************\n"