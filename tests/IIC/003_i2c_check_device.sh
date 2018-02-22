#!/bin/sh
# i2c device driver autotest shell-script

set -e
#set -x

echo "\n*************************I2C CHECK DEVICE TEST**************************\n"

if ls /sys/bus/platform/drivers | grep $DRIVER; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

echo "\n************************************************************************\n"
