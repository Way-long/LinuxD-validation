#!/bin/sh
# sound device driver autotest shell-script

set -e
#set -x

echo "\n***********************RECORD AND KILL RECORD WHILE APLAY***************\n"

cmd="aplay -f cd -t wav $APLAY_WAV_FILE" 
echo $cmd

# Check aplay file no error with 10s
if ! eval "$cmd -d 10" > /dev/null;then 
	echo "aplay file error"
	eval $FAIL_MEG
	exit 1	
fi

eval $cmd &

sleep 5

# Check arecord file no error with 10s
cmd="arecord -f cd -t wav $RECORD_WAV_FILE"
if ! eval "$cmd -d 10" > /dev/null ;then 
	echo "arecord file error"
	eval $FAIL_MEG
	exit 1	
fi

for a in $(seq 1 10);
do
	#record file sound
	echo $cmd
	
	eval "$cmd -d 20" &
	
	sleep 5
	
	$(dirname $0)/../common/ctr_c.sh "$RECORD_CMD"

	rm -r $RECORD_WAV_FILE

done

echo "kill aplay process"
$(dirname $0)/../common/ctr_c.sh "$APLAY_CMD"

if ! [ "$?" -eq "0" ]; then
	eval $FAIL_MEG
fi

eval $PASS_MEG

echo "\n************************************************************************\n"