#!/bin/sh
# sdhi device driver autotest shell-script

set -e
#set -x

echo "\n*************************SUSPEND BEFORE COPY DATA***********************\n"

if ! $CMD_SSH "exit" > /dev/null 2>&1;then
	echo "Cannot connect to board by ssh. Please reset board and test again."
	eval $FAIL_MEG
	exit 1
fi

$CMD_SSH <<ENDSSH

	eval $PREPARE_SUSPEND

	sleep 1

	eval $CMD_SUSPEND &

ENDSSH

sleep 5

eval $CMD_RESUME

if ! $CMD_SSH "exit" > /dev/null 2>&1;then
	echo "Can't resume driver PM."
	eval $FAIL_MEG
	exit 1
fi

$CMD_SSH <<ENDSSH

	exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_sdhi.sh 009_sdhi_write_ram_to_sdhi0_100MB.sh
	
ENDSSH

echo "\n************************************************************************\n"