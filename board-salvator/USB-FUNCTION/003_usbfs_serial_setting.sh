#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n**********************USB FUNCTION SERIAL SETTING**************\n"

#modprobe device
$CMD_SSH <<ENDSSH

modprobe g_serial

ENDSSH

sleep 2

if ! ls /dev/ttyACM0 | grep "ttyACM0";then
	eval $FAIL_MEG
	exit 1
fi	

eval $PASS_MEG

sleep 5

#rmmod device
$CMD_SSH <<ENDSSH

rmmod g_serial

ENDSSH

echo "\n***************************************************************\n"