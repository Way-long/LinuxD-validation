#!/bin/bash
# sound device driver autotest shell-script

set -e
#set -x

echo "\n*******************SMP MULTIPLE CPU RECORD AND APLAY********************\n"

# setting volume to test
$(dirname $0)/sound_setting_volume.sh > /dev/null

# Multiple cpu test
for ((N=0;N<CPU_NUMBER;N++))
do 

	echo "Run with CPU $N"
	echo "------------------------------------------------------------------------"

	cmd="taskset -c $N arecord -t wav -d 60 -r 44100 -f S16_LE $RECORD_WAV_FILE" 
	echo $cmd

	eval $cmd & sleep 10 

	cmd="taskset -c $N aplay $RECORD_WAV_FILE"
	echo $cmd

	if ! eval $cmd;then
		echo "error while aplay file"
		eval $FAIL_MEG
		exit 1
	fi

done

eval $PASS_MEG

echo "\n************************************************************************\n"