#!/bin/bash
# sdhi device driver autotest shell-script

set -a
#set -x

echo "\n******************SIMULTANEOUSLY COPY RAM AND SDHI*************\n"

$(dirname $0)/sdhi_simultaneously_copy_ram_and_sdhi.sh $SD2_DIR 100

echo "\n***************************************************************\n"