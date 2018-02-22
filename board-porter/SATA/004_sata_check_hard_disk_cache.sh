#!/bin/sh
# sata device driver autotest shell-script

set -e
#set -x

echo "\n***************************CHECK HARD DISK CACHE SATA*******************\n"

FLAG=0

cmd="hdparm -tT /dev/sda"
echo "$cmd"

eval $cmd > $LOGFILE

for log in "Timing cached reads" "Timing buffered disk reads"
do
	if ! cat $LOGFILE | grep "$log"  > /dev/null; then
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