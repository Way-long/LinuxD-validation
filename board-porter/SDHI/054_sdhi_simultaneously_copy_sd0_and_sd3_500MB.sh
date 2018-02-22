#!/bin/sh
# sdhi device driver autotest shell-script

set -a
#set -x

echo "\n********************SIMULATANEOUSLY COPY 2 SDHI****************\n"

$(dirname $0)/sdhi_simultaneously_copy_inside_two_sdhi.sh $SD1_DIR $SD2_DIR 500

echo "\n***************************************************************\n"