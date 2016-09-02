#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

i=30

if [ "$CPU_NUMBER" -gt 1 ];then

	CPU_NUM=0
	while [ "$CPU_NUM" -lt "$(($CPU_NUMBER - 1))" ]
	do
		taskset -c $CPU_NUM $(dirname $0)/ftp_put_board_to_pc_data.sh $size $(($i+30)) &
	    i=$(($i+10))
	    CPU_NUM=$(($CPU_NUM+1))
	done

	taskset -c $(($CPU_NUMBER - 1)) $(dirname $0)/ftp_put_board_to_pc_data.sh 30

fi