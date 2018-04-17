#!/bin/sh
# i2c device driver autotest shell-script

set -e
#set -x

echo "\n*********************CHECK INTERRUPT AFTER START THE BOARD**************\n"

exec $(dirname $0)/../common/proc-interrupts-multiple.sh "$I2C_INTERRUPT_1" "$I2C_INTERRUPT_2"

echo "\n************************************************************************\n"