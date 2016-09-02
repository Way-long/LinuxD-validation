#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n********************WRITE SPEED USB3.0 TEST********************\n"

$(dirname $0)/usb_write_speed.sh $USB3_DIR

echo "\n***************************************************************\n"