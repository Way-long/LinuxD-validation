#!/bin/sh
# sdhi device driver autotest shell-script

set -a
#set -x

echo "\n**************************SATA TEST BLOCK OVER SEEK*********************\n"

fdisk -l /dev/${DEVICE_SD0}p1 > $LOGFILE

fil=$LOGFILE

if [ -f $fil ]; then

#get sector device 
seek=`grep total $fil | tail -1 | cut -d , -f4| cut -d l -f2 | cut -d s -f1`

xbs=`grep Units $fil | tail -1 | cut -d = -f3 | cut -d = -f2 |cut -d b -f1 | tr -d ' '`

fi

seek_ok=$(($seek - 1))

cmd="dd if=/dev/zero of=/dev/${DEVICE_SD0}p1 bs=$xbs count=1 seek=${seek_ok}"
echo $cmd

eval $cmd

if eval $cmd; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi	

rm -rf $LOGFILE

echo "\n************************************************************************\n"