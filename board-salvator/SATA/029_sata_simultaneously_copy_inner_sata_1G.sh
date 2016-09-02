#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

echo "\n*************************SIMULTANEOUSLY COPY INNER**********************\n"

$(dirname $0)/sata_simultaneously_copy_inner_sata.sh 1024

echo "\n************************************************************************\n"