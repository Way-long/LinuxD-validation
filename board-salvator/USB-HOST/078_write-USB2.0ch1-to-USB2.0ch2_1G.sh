#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n************************WRITE DATA INSIDE TWO USB2.0********************\n"

$(dirname $0)/usb_copy_data.sh $USB2_DIR $USB2_CH2_DIR 1024

echo "\n************************************************************************\n"