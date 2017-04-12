#!/bin/bash

# arguments
runningTime=$1
soundFile=$2
if [[ ! -n "$runningTime" ]]; then
	runningTime=300
fi
if [[ ! -n "$soundFile" ]]; then
	soundFile="test.wav"
fi

folder="$(dirname $0)/tmp/records"
if ! ls "$folder" > /dev/null 2>&1; then
	echo "Make folder"
	mkdir -p "$folder"
	chmod 777 "$folder"
fi
f="$folder/$soundFile"

arecord -f s16_le -t wav -c2 -r 44100 -d $runningTime $f
chmod 666 "$f"
