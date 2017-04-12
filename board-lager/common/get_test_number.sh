#!/bin/bash
# this program is run in /root. Please login /root with 'su' command

set -e
#set -x

LIT=$(echo $1 | grep -o "[0-9]*" | head -1)
VAL=$(expr $LIT + 0)

if [[ "$2" -ne "" ]]; then
	if [[ "$2" -eq "$VAL" ]]; then
		echo $VAL
	else
		echo 0
	fi	
else
	echo $VAL
fi
