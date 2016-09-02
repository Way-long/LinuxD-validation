#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n*************************READ DATA FROM USB3.0 TO RAM********************\n"

$(dirname $0)/usb_copy_data.sh $USB3_DIR $RAM_DIR 10

echo "\n************************************************************************\n"