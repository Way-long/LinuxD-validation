#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n***********************APLAY FILE SOUND REPEATLY************************\n"

# record to aplay file 
for i in $(seq 1 5);
do
	cmd="arecord -c 2 -f S16_LE -t wav -r 44100 $(dirname $0)/record${i}.wav -d 60"
	echo $cmd

	if ! eval $cmd; then
		echo "arecord file error"
		eval $FAIL_MEG
		exit 1
	fi
done
	
for i in $(seq 1 5);
do
	cmd="aplay $(dirname $0)/record${i}.wav"
	echo $cmd

	if ! eval $cmd; then
		echo "aplay file error"
		eval $FAIL_MEG
		exit 1
	fi
done

eval $PASS_MEG

sync

# remove file
if ! rm -rf $(dirname $0)/record*; then
	echo "remove file error please try again"
fi

echo "\n************************************************************************\n"