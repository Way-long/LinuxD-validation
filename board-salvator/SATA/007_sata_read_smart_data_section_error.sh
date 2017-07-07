#!/bin/sh
# sata device driver autotest shell-script

#set -e
#set -x

echo "\n************************READ SMART SECTION SATA ERROR*******************\n"

cmd="smartctl -d ata -a /dev/sda"
echo "$cmd"

eval $cmd > $LOGFILE

if cat $LOGFILE | grep "SMART support is: Available - device has SMART capability"  > /dev/null ; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

if [ -f $LOGFILE ]; then 
	rm $LOGFILE
fi

echo "\n************************************************************************\n"
