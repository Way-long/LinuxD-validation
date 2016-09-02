#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n***************************STRESS CPU TEST******************************\n"

# Run stress
stress --cpu $CPU_NUMBER --io $(($CPU_NUMBER + $CPU_NUMBER)) --vm $CPU_NUMBER --vm-bytes 20M --timeout 3600s &

cmd="arecord -D hw:0,0 -f s16_le -t wav -c2 -r 44100 -d 1800 $RECORD_WAV_FILE"
echo $cmd

if eval $cmd;then
	echo "arecord file error"
	eval $FAIL_MEG
	exit 1
fi	

cmd="aplay $RECORD_WAV_FILE"
echo $cmd

if eval $cmd;then
	echo "aplay file error"
	eval $FAIL_MEG
	exit 1
fi

eval $PASS_MEG

echo "\n************************************************************************\n"