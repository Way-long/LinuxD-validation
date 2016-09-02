#!/bin/sh
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n*********************CHECK INTERRUPT AFTER START THE BOARD**************\n"

$(dirname $0)/../common/proc-interrupts-multiple.sh "$SDHI_INTERRUPT_0" "$SDHI_INTERRUPT_1"

echo "\n************************************************************************\n"