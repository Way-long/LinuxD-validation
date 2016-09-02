#!/bin/sh
# dmesg.sh
#
# implement CTR-C command
# 
# Copyright (C) 2013 Horms Soltutions Ltd.
#
# Contact: Simon Horman <horms@verge.net.au>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.

set -e
#set -x

PATTERN="[0-9]:[0-9][0-9]\+ \+$1"
FILE="ctr_z.txt"

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

#kill process
if kill -TSTP $PID ; then
    echo "Pause successful"
else
    echo "Pause failed"
fi

sleep 1

#restart process
if kill -CONT $PID ; then 
    echo "Restart successful"
else
    echo "Restart failed"
fi

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

rm -rf $FILE