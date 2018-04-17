#!/bin/sh
# usb device driver autotest shell-script

set -a
#set -x

echo "\n***************************USB TEST BLOCK OVER SEEK*********************\n"

fdisk -l /dev/${DEVICE_USB2C1}1 > $LOGFILE 2>&1

fil=$LOGFILE

if [ -f $fil ]; then

#get sector device 
seek=`grep Disk $fil | tail -1 | cut -d ' '  -f5`
xbs=`grep Units $fil | tail -1 | cut -d ' '  -f8`
fi

seek=`expr $seek / $xbs`
seek_ok=$(($seek - 1))

cmd="dd if=/dev/zero of=/dev/${DEVICE_USB2C1}1 bs=$xbs count=1 seek=${seek_ok}"
echo $cmd

if eval $cmd; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi	

rm -rf $LOGFILE

echo "\n************************************************************************\n"
