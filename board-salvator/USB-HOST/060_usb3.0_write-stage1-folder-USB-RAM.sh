#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n***********************WRITE FOLDER FROM RAM TO USB3.0*******************\n"

$(dirname $0)/usb_copy_folder.sh $RAM_DIR $USB3_DIR 1

echo "\n************************************************************************\n"