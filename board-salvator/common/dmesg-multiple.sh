#!/bin/bash

set -e
#set -x

OK=0

for var in "$@"
do
	echo "finding $var ..."
	$(dirname $0)/dmesg-quiet.sh "$var"

	if [ "$?" -eq "0" ]; then
		echo "$var was found"
		OK=$(($OK + 1))
	fi
done

if [ "$OK" = "$#" ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi	
