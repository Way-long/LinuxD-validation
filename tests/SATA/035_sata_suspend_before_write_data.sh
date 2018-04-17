#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

echo "\n*************************SUSPEND INSIDE COPY DATA***********************\n"

$CMD_SSH <<ENDSSH

	$SHELL_SOURCE_CODE/$DRIVER_PATH/exec_sata.sh 011_sata_write_ram_to_sata_100MB.sh

	sleep 1

	eval $PREPARE_SUSPEND
	eval $CMD_SUSPEND &

ENDSSH

sleep 5

eval $CMD_RESUME

$CMD_SSH <<ENDSSH

	$SHELL_SOURCE_CODE/$DRIVER_PATH/exec_sata.sh 011_sata_write_ram_to_sata_100MB.sh

ENDSSH

echo "\n************************************************************************\n"
