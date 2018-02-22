#!/bin/sh
# wait procee

set -e
#set -x

PATTERN="[0-9]:[0-9][0-9]\+ \+$1"
FILE="wait.txt"

ps -aux | grep "$PATTERN"
ps -aux | grep "$PATTERN" > $FILE

NUM=0
PARAMETER="`cat $FILE`"

# Looking for info
for info in $PARAMETER
do
	NUM=$(($NUM + 1))
	if [ $NUM -eq 2 ]; then
    	PID=$info
	fi
done

echo $PID

while :
do
    if ps -p $PID > /dev/null
	then
		echo "Please wait. Process is running"
	else   
		break
	fi
    sleep 5
done 

echo "break while loop"

rm -rf $FILE