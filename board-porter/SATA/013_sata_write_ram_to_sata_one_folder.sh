#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

echo "\n***********************WRITE FOLDER FROM RAM TO SATA********************\n"

$(dirname $0)/sata_copy_folder.sh $RAM_DIR $HDD_DIR 1

echo "\n************************************************************************\n"