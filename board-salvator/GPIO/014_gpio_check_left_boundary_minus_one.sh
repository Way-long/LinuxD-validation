#!/bin/sh
# gpio device driver autotest shell-script

set -e
#set -x

echo "\n***************************CHECK GPIO BOUNDARY PORT*********************\n"

PORT_NAME=$(($LEFT_BOUNDARY_PORT - 1))

if ! echo $PORT_NAME > /sys/class/gpio/export;then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

echo "\n************************************************************************\n"
