#!/bin/sh
# i2c device driver autotest shell-script

set -e
#set -x

echo "\n************************I2C UNBIND BIND DEVICE TEST*********************\n"

if ! $(dirname $0)/../common/unbind-bind.sh "$DRIVER" "$I2C_INTERRUPT_1";then
    eval $FAIL_MEG
    exit 1
fi

cmd="aplay $(dirname $0)/data/test.wav"
echo $cmd
sleep 1

if ! eval $cmd;then
	eval $FAIL_MEG
	exit 1
fi

eval $PASS_MEG

echo "\n************************************************************************\n"