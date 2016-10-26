#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

echo "\n**********************READ SPEED SATA TEST********************\n"

$(dirname $0)/sata_read_speed.sh $HDD_DIR $DEVICE_SATA_PART1

echo "\n***************************************************************\n"