#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n***************************APLAY FILE SOUND*****************************\n"

# setting volume to test
$(dirname $0)/sound_setting_volume.sh > /dev/null

cmd="aplay $(dirname $0)/data/$APLAY_WAV_FILE -d 20"
echo $cmd

if ! eval $cmd ; then
	eval $FAIL_MEG
fi

eval $PASS_MEG

echo "\n************************************************************************\n"