#!/bin/sh
# i2c device driver autotest shell-script

set -e
#set -x

echo "\n************************I2C UNBIND BIND DEVICE TEST*********************\n"

# First, unbind those devices which attached on the i2c bus.
[ -f /sys/bus/platform/devices/e6ef0000.video/driver/unbind ] && echo e6ef0000.video > /sys/bus/platform/devices/e6ef0000.video/driver/unbind
[ -f /sys/bus/platform/devices/feb00000.display/driver/unbind ] && echo feb00000.display > /sys/bus/platform/devices/feb00000.display/driver/unbind
[ -f /sys/bus/platform/devices/ec500000.sound/driver/unbind ] && echo ec500000.sound > /sys/bus/platform/devices/ec500000.sound/driver/unbind

if ! $(dirname $0)/../common/unbind-bind.sh "$DRIVER" "$I2C_INTERRUPT_1";then
    eval $FAIL_MEG
    exit 1
fi

eval $PASS_MEG

echo "\n************************************************************************\n"
