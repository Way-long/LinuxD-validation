#!/bin/bash
# sdhi device driver autotest shell-script

set -e
#set -x

if [ $# -lt 2 ]; then
    echo "usage : $(basename $0) SD1_DIRECTORY SD2_DIRECTORY"
    exit 1
fi

CARD1_DIR="$1"
CARD2_DIR="$2"

echo "Run taskset cpu"

i=10
j=0
if [ "$CPU_NUMBER" -gt 1 ];then

	CPU_NUM=0
	while [ "$CPU_NUM" -lt "$(($CPU_NUMBER - 1))" ]
	do
		if [ "$j" = "0" ];then
			taskset -c $CPU_NUM $(dirname $0)/sdhi_smp_read_write_copy_one.sh $RAM_DIR $CARD1_DIR $(($i+10)) &
	    	j=1
		fi

		if [ "$j" = "1" ];then
			taskset -c $CPU_NUM $(dirname $0)/sdhi_smp_read_write_copy_one.sh $RAM_DIR $CARD2_DIR $(($i+10)) &
	    	j=0
		fi

	    i=$(($i+10))
	    CPU_NUM=$(($CPU_NUM+1))
	done

	taskset -c $(($CPU_NUMBER - 1)) $(dirname $0)/sdhi_smp_read_write_copy_one.sh $RAM_DIR $CARD2_DIR 10

fi