#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

echo "\n*************************READ DATA FROM SATA TO RAM*********************\n"

$(dirname $0)/sata_copy_data.sh $HDD_DIR $RAM_DIR 100

echo "\n************************************************************************\n"