#!/bin/sh
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n*************************CTR+Z WRITE DATA**********************\n"

$(dirname $0)/sdhi_ctr_z_write_ram_to_sdx.sh $SD1_DIR

echo "\n***************************************************************\n"