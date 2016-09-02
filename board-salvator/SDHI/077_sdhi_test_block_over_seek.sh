#!/bin/sh
# sdhi device driver autotest shell-script

set -a
#set -x

echo "\n**************************SATA TEST BLOCK OVER SEEK*********************\n"

fdisk -l ${DEVICE_SD1}p1 > $LOGFILE

fil=$LOGFILE

if [ -f $fil ]; then

#get sector device 
seek=`grep total $fil | tail -1 | cut -d , -f4| cut -d l -f2 | cut -d s -f1`

xbs=`grep Units $fil | tail -1 | cut -d = -f3 | cut -d = -f2 |cut -d b -f1 | tr -d ' '`

fi

seek_over=$(($seek + 1))

dd if=/dev/zero of=${DEVICE_SD1}p1 bs=$xbs count=1 seek=${seek_over}

if [ "$?" = "0" ]; then
	eval $FAIL_MEG
else
	eval $PASS_MEG
fi	

rm -rf $LOGFILE

echo "\n************************************************************************\n"