#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n*************************READ DATA FROM SDHI TO RAM*********************\n"

$(dirname $0)/sdhi_copy_data.sh $SD2_DIR $RAM_DIR 100

echo "\n************************************************************************\n"