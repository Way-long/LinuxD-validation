#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*************IPERF TRANFERS RATE FROM BOARD TO HOST PC **************\n"

iperf -s -u &

sleep 2

$CMD_SSH <<ENDSSH

	exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_ethernet.sh iperf_board_to_pc.sh

ENDSSH

#kill all process iperf for next test
$(dirname $0)/../common/kill_process.sh "iperf -s -u"	

echo "\n*********************************************************************\n"