#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

if [ $# -lt 1 ]; then
    echo "usage : $(basename $0) BIT_RATE"
    exit 1
fi

BIT_RATE="$1"

cmd="arecord -D hw:0,0 -f s16_le -t wav -c 2 -r $BIT_RATE -d 360 $RECORD_WAV_FILE"
echo $cmd

if ! eval $cmd ; then
    eval $FAIL_MEG
    exit 1
fi

sleep 1

cmd="aplay -D hw:0,0 -f s16_le -t wav -c 2 -r $BIT_RATE $RECORD_WAV_FILE"
echo $cmd

if ! eval $cmd ; then
    eval $FAIL_MEG
    exit 1
fi

eval $PASS_MEG
