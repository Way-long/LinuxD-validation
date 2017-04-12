#!/bin/bash

echo "suspending while transferring data"

echo "ping google.com"
{
	if ssh $SSH_AUTHEN "ping -c 10 google.com" ; then
		echo "ping finished"
	else
		echo "ping finished with error code"
	fi
} &
pid=$!
sleep 3


$(dirname $0)/../common/suspend_resume.sh

if ps -p $pid > /dev/null;then
	echo "wait $pid"
	wait $pid
fi

on_board_path=`$(dirname $0)/../common/path_helper.sh`
ssh $SSH_AUTHEN "$on_board_path/../common/check_ping.sh"
