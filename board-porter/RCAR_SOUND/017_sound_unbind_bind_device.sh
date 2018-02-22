#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n***********************SOUND UNBIND BIND DEVICE TEST********************\n"

# setting volume to test
$(dirname $0)/sound_setting_volume.sh > /dev/null

if ! $(dirname $0)/../common/unbind-bind.sh "$DRIVER" "$SOUND_INTERRUPT";then
	eval $FAIL_MEG
	exit 1
fi

cmd="arecord -D hw:0,0 -f s16_le -t wav -c 2 -r 44100 -d 360 $RECORD_WAV_FILE"
echo $cmd

if ! eval $cmd ; then
	eval $FAIL_MEG
	exit 1
fi

sleep 1

cmd="aplay -D hw:0,0-f s16_le -t wav -c 2 -r 44100 $RECORD_WAV_FILE"
echo $cmd

if ! eval $cmd ; then
    eval $FAIL_MEG
    exit 1
fi

eval $PASS_MEG

echo "\n************************************************************************\n"