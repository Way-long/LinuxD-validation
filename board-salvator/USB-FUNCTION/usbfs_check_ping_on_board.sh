#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

RANDOM=`echo $RANDOM | tr '[0-9]' '[a-zA-Z]'`

cmd="ping -c 10 $IP_ADDRESS_PC >> ${LOGFILE}-$RANDOM"
echo $cmd
if ! eval $cmd;then
    echo "ping error."
    eval $FAIL_MEG
	exit 1
fi

cat ${LOGFILE}-$RANDOM

if cat ${LOGFILE}-$RANDOM | grep "received, 0% packet loss" > /dev/null ;then 
	eval $PASS_MEG
else
	echo "packet loss error"
	eval $FAIL_MEG
fi

rm -rf $LOGFILE