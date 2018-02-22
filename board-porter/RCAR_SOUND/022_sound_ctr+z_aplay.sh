#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n***********************CTR+C AFTER APLAY FILE SOUND*********************\n"

# setting volume to test
$(dirname $0)/sound_setting_volume.sh > /dev/null

#aplay file sound
cmd="aplay -f cd -t wav $APLAY_WAV_FILE"
echo $cmd

eval $cmd &

sleep 20

$(dirname $0)/../common/ctr_z.sh "$APLAY_CMD"

echo "after ctr_c command implement"
sleep 5

cmd="aplay -f cd -t wav $APLAY_WAV_FILE"
echo $cmd

if ! eval $cmd;then
	eval $FAIL_MEG
	exit 1
fi	

eval $PASS_MEG

echo "\n************************************************************************\n"