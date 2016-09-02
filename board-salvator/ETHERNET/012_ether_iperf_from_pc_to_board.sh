#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*************IPERF TRANFERS RATE FROM HOST PC TO BOARD**************\n"

sleep 3

echo "run iperf on board"

{
	eval $CMD_SSH "iperf -s -u"
}&

$(dirname $0)/iperf_pc_to_board.sh

$CMD_SSH <<ENDSSH

	exec $SHELL_SOURCE_CODE/common/kill_process.sh 'iperf -s -u'

ENDSSH

echo "\n*********************************************************************\n"