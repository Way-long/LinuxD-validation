#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

# suspend system before copy data
$CMD_SSH <<ENDSSH

eval $PREPARE_SUSPEND &

ENDSSH

sleep 5

eval $CMD_RESUME

# Ping the Board -> the host PC
if ping -c 20 -I $INTERFACE $GOOGLE & eval $CMD_SUSPEND; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi