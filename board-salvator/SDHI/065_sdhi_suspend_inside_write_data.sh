#!/bin/sh
# sdhi device driver autotest shell-script

set -a
#set -x

echo "\n*************************SUSPEND INSIDE COPY DATA***********************\n"

$CMD_SSH <<ENDSSH

	eval $PREPARE_SUSPEND

	exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_sdhi.sh sdhi_start_write_suspend_data.sh
	
ENDSSH

sleep 5

eval $CMD_RESUME

$CMD_SSH <<ENDSSH
	
	exec $SHELL_SOURCE_CODE/$DRIVER_PATH/sdhi_end_write_suspend_data.sh
	
ENDSSH

echo "\n************************************************************************\n"
