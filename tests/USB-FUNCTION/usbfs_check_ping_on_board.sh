#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

echo "11212" > test.log

RANDOM_FILE=`echo $RANDOM | tr '[0-9]' '[a-zA-Z]'`

cmd="ping -c 10 $IP_ADDRESS_PC >> ${LOGFILE}-$RANDOM_FILE"
echo $cmd

if ! eval $cmd;then
    echo "ping error."
    eval $FAIL_MEG
	exit 1
fi

cat ${LOGFILE}-$RANDOM_FILE

if cat ${LOGFILE}-$RANDOM_FILE | grep "received, 0% packet loss" > /dev/null ;then 
	eval $PASS_MEG
else
	echo "packet loss error"
	eval $FAIL_MEG
fi

rm -rf $LOGFILE
