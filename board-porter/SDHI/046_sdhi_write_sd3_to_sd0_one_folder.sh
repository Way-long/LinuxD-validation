#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n************************WRITE FOLDER INSIDE 2 SDHI**********************\n"

$(dirname $0)/sdhi_copy_folder.sh $SD2_DIR $SD1_DIR 1

echo "\n************************************************************************\n"