#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

echo "\n*************************SUSPEND INSIDE COPY DATA***********************\n"

eval $PREPARE_SUSPEND

$CMD_SSH <<ENDSSH

	$(dirname $0)/exec_sdhi.sh 009_sdhi_write_ram_to_sdhi0_100MB.sh

	sleep 1

	eval $CMD_SUSPEND &

ENDSSH

sleep 5

eval $CMD_RESUME

$CMD_SSH <<ENDSSH

	$(dirname $0)/exec_sdhi.sh 009_sdhi_write_ram_to_sdhi0_100MB.sh
	
ENDSSH

echo "\n************************************************************************\n"
