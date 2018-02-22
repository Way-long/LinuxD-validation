#!/bin/sh
# i2c device driver autotest shell-script

set -e
#set -x

echo "\n***********************I2C CHECK DEVICE NODE TEST***********************\n"

for device in "$I2C_DEVICE_1" "$I2C_DEVICE_2"
do
	if ls /dev/i2c-* | grep "$device" > /dev/null ; then
		echo "device $device was found"
	else	
		echo "device $device not exits"
		eval $FAIL_MEG
		exit 1
	fi
done

eval $PASS_MEG

echo "\n************************************************************************\n"

