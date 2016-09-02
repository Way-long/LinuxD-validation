#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n********************HDD WRITE DATA USB3.0 to USB2.0*********************\n"

$(dirname $0)/usb_copy_data.sh $USB3_DIR $USB2_DIR 1024

echo "\n************************************************************************\n"