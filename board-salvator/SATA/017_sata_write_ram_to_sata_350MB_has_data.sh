#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

echo "\n********************WRITE DATA FROM RAM TO SATA HAS DATA****************\n"

$(dirname $0)/sata_copy_data.sh $RAM_DIR $HDD_DIR 350 1

echo "\n************************************************************************\n"