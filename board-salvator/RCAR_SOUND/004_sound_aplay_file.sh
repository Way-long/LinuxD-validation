#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n***************************APLAY FILE SOUND*****************************\n"

cmd="aplay $APLAY_WAV_FILE"
echo $cmd

if ! eval $cmd ; then
	eval $FAIL_MEG
fi

eval $PASS_MEG

echo "\n************************************************************************\n"