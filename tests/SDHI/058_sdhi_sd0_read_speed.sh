#!/bin/sh
# sdhi device driver autotest shell-script

set -a
#set -x

echo "\n*********************READ SPEED SDHI TEST(SD0)*****************\n"

$(dirname $0)/sdhi_sdx_read_speed.sh $SD1_DIR $DEVICE_SD0_PART1

echo "\n***************************************************************\n"