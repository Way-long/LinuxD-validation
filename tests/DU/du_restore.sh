#!/bin/sh
# display unit device driver autotest shell-script

set -a
#set -x

sleep 5

#kill all process modetest
$(dirname $0)/../common/kill_process.sh "modetest" > /dev/null 2>&1
