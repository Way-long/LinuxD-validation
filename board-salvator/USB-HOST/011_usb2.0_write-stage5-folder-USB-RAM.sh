#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n***********************WRITE FOLDER FROM RAM TO USB2.0*******************\n"

$(dirname $0)/usb_copy_folder.sh $RAM_DIR $USB2_DIR 5

echo "\n************************************************************************\n"