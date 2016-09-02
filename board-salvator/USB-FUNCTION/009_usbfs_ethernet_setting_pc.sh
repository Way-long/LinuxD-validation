#!/bin/bash

set -e
#set -x

echo "USB FUNCTION ETHERNET SETTING"

#modprobe device
$CMD_SSH <<ENDSSH

modprobe g_ether

ENDSSH

sleep 2

ifconfig -a > log.txt

usb0=`grep usb0 log.txt | tail -n 1 | cut -c-4  | sed 's/[[:space:]]//g'` 

if [ "$usb0" == "usb0" ]; then
	echo "TEST PASSED"
else
	echo "TEST FAILED"
	exit "$?"
fi

rm -rf log.txt

sleep 5

#rmmod device
$CMD_SSH <<ENDSSH

rmmod g_ether

ENDSSH