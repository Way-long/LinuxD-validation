#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n************************WRITE DATA USB3.0 to USB2.0*********************\n"

$(dirname $0)/usb_copy_data.sh $USB3_DIR $USB2_DIR 500

echo "\n************************************************************************\n"