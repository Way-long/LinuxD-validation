#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n*************************READ DATA FROM USB2.0 TO RAM********************\n"

$(dirname $0)/usb_copy_data.sh $USB2_DIR $RAM_DIR 100

echo "\n************************************************************************\n"