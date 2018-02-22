#!/bin/bash
# sata device driver autotest shell-script

set -e
#set -x

echo "\n*************************SUSPEND INSIDE COPY DATA***********************\n"

eval $PREPARE_SUSPEND

$CMD_SSH <<ENDSSH

	$(dirname $0)/exec_sata.sh sata_read_sata_to_ram_100MB.sh

	sleep 1

	eval $CMD_SUSPEND &

ENDSSH

sleep 5

eval $CMD_RESUME

$CMD_SSH <<ENDSSH

	$(dirname $0)/exec_sata.sh sata_read_sata_to_ram_100MB.sh
	
ENDSSH

echo "\n************************************************************************\n"
