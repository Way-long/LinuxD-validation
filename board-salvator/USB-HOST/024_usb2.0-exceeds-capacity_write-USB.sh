#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n***********************EXCEEDS CAPACITY WRITE**********************\n"

$(dirname $0)/usb_exceeds_capacity_write.sh $USB2_DIR

echo "\n*******************************************************************\n"