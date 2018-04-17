#!/bin/sh
# sdhi device driver autotest shell-script

set -a
#set -x

echo "\n****************************SATA TEST LAST BLOCK***************************\n"

fdisk -l /dev/${DEVICE_SD0}p1 > $LOGFILE

fil=$LOGFILE

if [ -f $fil ]; then

#get sector device 
seek=`grep Disk $fil | tail -1 | cut -d ' '  -f5`
xbs=`grep Units $fil | tail -1 | cut -d ' '  -f8`
fi

seek=`expr $seek / $xbs`

cmd="dd if=/dev/zero of=/dev/${DEVICE_SD0}p1 bs=$xbs count=1 seek=$seek"
echo $cmd

if eval $cmd; then
	eval $FAIL_MEG
else
	eval $PASS_MEG
fi	

rm -rf $LOGFILE

echo "\n************************************************************************\n"
