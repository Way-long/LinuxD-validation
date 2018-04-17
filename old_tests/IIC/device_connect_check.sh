#!/bin/sh
# i2c device driver autotest shell-script

set -e
#set -x

if [ $# -ne 2 ]; then
	echo "usage: $(basename $0) I2C_DEVICE I2C_NAME" >&2
	exit 1
fi

I2C_DEVICE="$1"
I2C_NAME="$2"

cmd="cat /sys/bus/i2c/devices/${I2C_DEVICE}/name | grep $I2C_NAME"
echo $cmd
sleep 1

if ! eval $cmd;then
	echo "$I2C_NAME not exits"
	exit 1
fi