#!/bin/sh
# sdhi device driver autotest shell-script

set -a
#set -x

echo "\n********************WRITE SPEED SDHI TEST(SD0)*****************\n"

$(dirname $0)/sdhi_sdx_write_speed.sh $SD1_DIR $DEVICE_SD0_PART1

echo "\n***************************************************************\n"