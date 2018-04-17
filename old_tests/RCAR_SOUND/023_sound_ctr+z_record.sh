#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n***********************CTR+C AFTER APLAY FILE SOUND*********************\n"

# setting volume to test
$(dirname $0)/sound_setting_volume.sh > /dev/null

#record file sound
cmd="arecord -f cd -t wav $RECORD_WAV_FILE -d 60"
echo $cmd

eval $cmd &

sleep 20

$(dirname $0)/../common/ctr_z.sh "$RECORD_CMD"

echo "after ctr_c command implement"
sleep 5

cmd="arecord -f cd -t wav $RECORD_WAV_FILE -d 60"
echo $cmd

if ! eval $cmd;then
	eval $FAIL_MEG
	exit 1
fi

cmd="aplay -f cd -t wav $RECORD_WAV_FILE"
echo $cmd

if ! eval $cmd;then
	eval $FAIL_MEG
	exit 1
fi

eval $PASS_MEG

echo "\n************************************************************************\n"