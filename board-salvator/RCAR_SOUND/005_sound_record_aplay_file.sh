#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n**************************RECORD FILE SOUND*****************************\n"

# setting volume to test
$(dirname $0)/sound_setting_volume.sh > /dev/null

cmd="arecord -D hw:0,0 -f cd -t wav $(dirname $0)/data/$RECORD_WAV_FILE -d 60"
echo $cmd

if ! eval $cmd ; then
	eval $FAIL_MEG
	exit 1
fi

sleep 1

cmd="aplay -D hw:0,0 -f cd -t wav $RECORD_WAV_FILE"
echo $cmd

if ! eval $cmd ; then
	eval $FAIL_MEG
	exit 1
fi

eval $PASS_MEG

echo "\n************************************************************************\n"