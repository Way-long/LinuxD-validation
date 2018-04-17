#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

echo "\n************USB FUNCTION SERIAL TEST FROM BOARD TO PC**********\n"

#modprobe device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_modprobe.sh g_serial

ENDSSH

cmd="echo 'TEST SERIAL FROM BOARD TO PC PASSED' > /dev/ttyGS0"
echo $cmd

$CMD_SSH <<ENDSSH

eval $cmd

ENDSSH

# we need 2 seconds to get the serial device for our virtural machine(HOST)
sleep 2
# write file to log
cat /dev/ttyACM0 >> $LOGFILE &

sleep 5

LOG=`cat $LOGFILE`
echo $LOG

rm -rf $LOGFILE

if echo $LOG | grep "TEST SERIAL FROM BOARD TO PC PASSED";then
	eval $PASS_MEG
else	
	eval $FAIL_MEG
fi

sleep 2

#rmmod device
$CMD_SSH <<ENDSSH

$SHELL_SOURCE_CODE/$DRIVER_PATH/usbfs_rmmod.sh g_serial

ENDSSH

echo "\n***************************************************************\n"
