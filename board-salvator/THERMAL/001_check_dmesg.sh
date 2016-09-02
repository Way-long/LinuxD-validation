#!/bin/sh
# thermal device driver autotest shell-script

set -e
#set -x

echo "\n***************CHECK DMESG AFTER START THE BOARD***************\n"

$(dirname $0)/../common/dmesg.sh "$DRIVER ${INTERRUPT}: 1 sensor probed"

echo "\n***************************************************************\n"