#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n*****************UP DOWN VOLUME DURING APLAY FILE***********************\n"

# setting volume to test
$(dirname $0)/sound_setting_volume.sh > /dev/null

#aplay file sound
cmd="aplay -f cd -t wav $APLAY_WAV_FILE -d 60" 
echo $cmd

eval $cmd &

for volume in "200" "100" "50" "10" "0" "10" "50" "100" "200"; do

	sleep 5

    cmd="amixer set 'DVC Out' ${volume}%"
	echo $cmd

	if ! eval $cmd;then
		echo "amixer can not set $volume"
		eval $FAIL_MEG
		exit 1
	fi

done

$(dirname $0)/../common/wait_process.sh "$APLAY_CMD" > /dev/null

eval $PASS_MEG

echo "\n************************************************************************\n"