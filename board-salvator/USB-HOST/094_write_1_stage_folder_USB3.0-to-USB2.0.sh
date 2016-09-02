#!/bin/bash
# usb device driver autotest shell-script

set -e
#set -x

echo "\n************************WRITE FOLDER USB3.0 to USB2.0*******************\n"

$(dirname $0)/usb_copy_folder.sh $USB3_DIR $USB2_DIR 1

echo "\n************************************************************************\n"