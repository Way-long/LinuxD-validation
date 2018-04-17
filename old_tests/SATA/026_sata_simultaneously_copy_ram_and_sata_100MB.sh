#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

echo "\n**********************SIMULTANEOUSLY COPY RAM AND SATA******************\n"

$(dirname $0)/sata_simultaneously_copy_ram_and_sata.sh $HDD_DIR 100

echo "\n************************************************************************\n"