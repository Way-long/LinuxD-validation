#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*********************CHECK INTERRUPT AFTER START THE BOARD**************\n"

$(dirname $0)/../common/proc-interrupts-multiple.sh "$INTERFACE"

echo "\n************************************************************************\n"