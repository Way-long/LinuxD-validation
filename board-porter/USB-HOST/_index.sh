#!/bin/sh
# usb host device driver autotest shell-script

set -a
#set -x

FIRST_PARAM="$1"

if ! [ -n "$FIRST_PARAM" ];then
	for i in $(seq 1 1000);
	do
		$(dirname $0)/index.sh $i
	done

	exit 0
fi	

if echo $FIRST_PARAM | grep ":" > /dev/null ;then

	if [ -n "$2" ];then
		echo "input params failed. please try again"
		exit 0
	fi	

	BEGIN_ITEM=`echo $FIRST_PARAM | cut -f1 -d":"`
	END_ITEM=`echo $FIRST_PARAM | cut -f2 -d":"`

	for i in $(seq ${BEGIN_ITEM} ${END_ITEM});
	do
		$(dirname $0)/index.sh $i
	done

	exit 0
			
fi

for i in "$@"
do
   $(dirname $0)/index.sh $i	
done

