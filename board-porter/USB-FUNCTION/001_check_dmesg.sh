#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n************************CHECK DMESG AFTER START THE BOARD***************\n"

$(dirname $0)/../common/dmesg-multiple.sh "$DRIVER"

echo "\n************************************************************************\n"