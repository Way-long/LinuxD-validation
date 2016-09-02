#!/bin/sh
# sata device driver autotest shell-script

set -e
#set -x

echo "\n*********************CHECK INTERRUPT AFTER START THE BOARD**************\n"

$(dirname $0)/../common/proc-interrupts.sh "$SATA_INTERRUPT"

echo "\n************************************************************************\n"