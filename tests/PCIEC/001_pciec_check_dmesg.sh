#!/bin/sh
# pciec device driver autotest shell-script

set -e
#set -x

echo "\n************************CHECK DMESG AFTER START THE BOARD***************\n"

$(dirname $0)/../common/dmesg-multiple.sh "$DRIVER $PCIEC_INTERRUPT: PCIe x1: link up" "$INTEL_PCI_DRIVER"

echo "\n************************************************************************\n"