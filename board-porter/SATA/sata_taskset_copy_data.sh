#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

if [ $# -lt 2 ]; then
    echo "usage : $(basename $0) HDD1_DIRECTORY HDD2_DIRECTORY"
    exit 1
fi

HDD1_DIR="$1"
HDD2_DIR="$2"

echo "Run taskset cpu"

i=10
j=0
if [ "$CPU_NUMBER" -gt 1 ];then

	CPU_NUM=0
	while [ "$CPU_NUM" -lt "$(($CPU_NUMBER - 1))" ]
	do
		case "$j" in
		0)
			
	    	cmd="taskset -c 0 $(dirname $0)/sata_smp_read_write_copy_one.sh $RAM_DIR $HDD1_DIR $(($i+10)) &"
		    echo $cmd

		    eval $cmd
	    	j=1
		;;

		1)
			cmd="taskset -c 0 $(dirname $0)/sata_smp_read_write_copy_one.sh $RAM_DIR $HDD2_DIR $(($i+10)) &"
		    echo $cmd

		    eval $cmd

	    	j=0
		;;
		esac
	    
	    i=$(($i+10))
	    CPU_NUM=$(($CPU_NUM+1))
		
	done	

	cmd="taskset -c 0 $(dirname $0)/sata_smp_read_write_copy_one.sh $RAM_DIR $HDD2_DIR 10"
	echo $cmd

	eval $cmd

fi