#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n*****************HUB READ SPEED USB2.0 TEST********************\n"

$(dirname $0)/usb_read_speed.sh $USB2_DIR

echo "\n***************************************************************\n"