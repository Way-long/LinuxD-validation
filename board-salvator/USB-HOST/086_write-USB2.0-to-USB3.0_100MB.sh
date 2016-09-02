#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n************************WRITE DATA USB2.0 to USB3.0*********************\n"

$(dirname $0)/usb_copy_data.sh $USB2_DIR $USB3_DIR 100

echo "\n************************************************************************\n"