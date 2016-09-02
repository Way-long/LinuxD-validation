#!/bin/sh
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n************************CHECK DMESG AFTER START THE BOARD***************\n"

$(dirname $0)/../common/dmesg-multiple.sh "$DRIVER $SDHI_INTERRUPT_0: mmc" "$DRIVER $SDHI_INTERRUPT_1: mmc"

echo "\n************************************************************************\n"