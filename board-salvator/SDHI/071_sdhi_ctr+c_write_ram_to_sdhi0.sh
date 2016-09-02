#!/bin/sh
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n*************************CTR+C WRITE DATA*******************************\n"

$(dirname $0)/sdhi_ctr_c_write_ram_to_sdx.sh $SD1_DIR

echo "\n************************************************************************\n"