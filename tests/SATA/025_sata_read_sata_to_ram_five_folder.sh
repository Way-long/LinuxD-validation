#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

echo "\n***********************READ FOLDER FROM SATA TO RAM*********************\n"

$(dirname $0)/sata_copy_folder.sh $HDD_DIR $RAM_DIR 5

echo "\n************************************************************************\n"