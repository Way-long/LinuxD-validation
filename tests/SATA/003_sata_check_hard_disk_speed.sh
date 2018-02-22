#!/bin/sh
# sata device driver autotest shell-script

set -e
#set -x

echo "\n***************************CHECK HARD DISK SPEED SATA*******************\n"

FLAG=0

cmd="hdparm -I /dev/sda | grep -i speed"
echo "$cmd"

eval $cmd > $LOGFILE

for gen in "Gen1" "Gen2" "Gen3"
do
	if ! cat $LOGFILE | grep $gen  > /dev/null; then
		eval $FAIL_MEG
		FLAG=1
		break
	fi
done

if [ "$FLAG" = "0" ]; then
	eval $PASS_MEG
fi

if [ -f $LOGFILE ]; then 
	rm $LOGFILE
fi

echo "\n************************************************************************\n"