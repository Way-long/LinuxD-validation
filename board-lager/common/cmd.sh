#!/bin/bash
cmd=$1
if [[ -n $LOG_CMD ]]; then
	echo "$CMD_POSITION$cmd"
fi
bash -c "$cmd"
exit $?