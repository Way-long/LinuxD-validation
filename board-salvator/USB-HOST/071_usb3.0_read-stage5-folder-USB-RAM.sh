#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n***********************READ FOLDER FROM USB3.0 TO RAM********************\n"

$(dirname $0)/usb_copy_folder.sh $USB3_DIR $RAM_DIR 5

echo "\n************************************************************************\n"