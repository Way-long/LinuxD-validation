#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n***********************EXCEEDS CAPACITY WRITE**********************\n"

$(dirname $0)/sdhi_exceeds_capacity_write.sh $SD1_DIR

echo "\n*******************************************************************\n"