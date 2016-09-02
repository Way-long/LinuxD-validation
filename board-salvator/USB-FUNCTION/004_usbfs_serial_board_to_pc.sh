#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n**********************USB FUNCTION SERIAL TEST*****************\n"

# write file to log
cat /dev/ttyACM0 >> $LOGFILE

#modprobe device
$CMD_SSH <<ENDSSH

modprobe g_serial

echo "TEST SERIAL FROM BOARD TO PC PASSED" > /dev/ttyGS0
echo "TEST SERIAL AUTOMATIC author by duclm" > /dev/ttyGS0

ENDSSH

sleep 2

LOG=`cat $LOGFILE`

rm -rf $LOGFILE

if ! cat $LOG | grep "TEST SERIAL FROM BOARD TO PC PASSED";then
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