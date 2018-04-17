#!/bin/sh
# sata device driver autotest shell-script

set -e
#set -x

echo "\n**************************ENABLE COMMAND SECTION SATA*******************\n"

cmd="smartctl -s on -d ata /dev/sda"
echo "$cmd"

eval $cmd > $LOGFILE

if cat $LOGFILE | grep "SMART Enabled" > /dev/null ; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

if [ -f $LOGFILE ]; then 
	rm $LOGFILE
fi

echo "\n************************************************************************\n"

