#!/bin/sh
# gpio device driver autotest shell-script

set -e
#set -x

echo "\n***************************CHECK GPIO BOUNDARY PORT*********************\n"

PORT_NAME=$(($RIGHT_BOUNDARY_PORT - 1))

echo "export $PORT_NAME"

if ! echo $PORT_NAME > /sys/class/gpio/export;then
	eval $FAIL_MEG
else
	eval $PASS_MEG
fi	

echo "unexport $PORT_NAME"
echo $PORT_NAME > /sys/class/gpio/unexport	

echo "\n************************************************************************\n"
