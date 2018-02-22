#!/bin/sh
# wait procee

set -e
#set -x

PATTERN="[0-9]:[0-9][0-9]\+ \+$1"

while :
do
    if ps -aux | grep "$PATTERN" > /dev/null
	then
		echo "Please wait. Process is running"
	else   
		break
	fi
    sleep 10
done 