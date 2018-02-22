#!/bin/sh
# i2c device driver autotest shell-script

set -e
#set -x

echo "\n************************CHECK DMESG AFTER START THE BOARD***************\n"

exec $(dirname $0)/../common/dmesg-multiple.sh "$I2C_SH_MOBILE $I2C_INTERRUPT_1: probed" 
"$I2C_SH_MOBILE $I2C_INTERRUPT_02: probed"

echo "\n************************************************************************\n"