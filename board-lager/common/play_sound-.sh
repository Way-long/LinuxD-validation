#!/bin/bash

# arguments
runningTime=$1
soundFile=$2
if [[ ! -n "$runningTime" ]]; then
	runningTime=300
fi
if [[ ! -n "$soundFile" ]]; then
	soundFile="$(dirname $0)/../data/test.wav"
fi

current_time=`date +%s`
((target_time=$current_time+$runningTime))
while [[ "$current_time" -lt "$target_time" ]]; do
	((playTime=$target_time-$current_time))
	aplay "$soundFile" -d "$playTime" > /dev/null 2>&1 || echo "ERROR: cannot play $soundFile"
	current_time=`date +%s`
done
