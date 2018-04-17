#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n**********************RECORD FILE SOUND REPEATLY************************\n"

# setting volume to test
$(dirname $0)/sound_setting_volume.sh > /dev/null

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
	
eval $PASS_MEG

sync

# remove file
if ! rm -rf $(dirname $0)/record*; then
	echo "remove file error please try again"
fi

echo "\n************************************************************************\n"