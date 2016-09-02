#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n***********************READ FOLDER FROM USB2.0 TO RAM********************\n"

$(dirname $0)/usb_copy_folder.sh $USB2_CH2_DIR $RAM_DIR 1

echo "\n************************************************************************\n"