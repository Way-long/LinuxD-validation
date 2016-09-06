#!/bin/sh
# usb function device driver autotest shell-script

set -e
#set -x

LOG=`cat $LOGFILE`

rm -rf $LOGFILE

if ! echo $LOG | grep "TEST SERIAL FROM PC TO BOARD PASSED";then
	eval $FAIL_MEG
	exit 1
fi

eval $PASS_MEG