#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n************************CHECK INTERFACE DEVICE SOUND********************\n"

cmd="cat /proc/devices | grep 'alsa' > /dev/null"
echo $cmd

if ! eval $cmd ; then
	eval $FAIL_MEG
fi

eval $PASS_MEG

echo "\n************************************************************************\n"