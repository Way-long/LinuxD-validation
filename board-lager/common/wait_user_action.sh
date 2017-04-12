#!/bin/bash
# this program is run in /root. Please login /root with 'su' command

set -e
#set -x

echo -e "$1"
while true;do
	read tem
	if [ "$tem" == "$2" ];
	then 
		break
	fi
	echo "input \"$2\" please..."
done
