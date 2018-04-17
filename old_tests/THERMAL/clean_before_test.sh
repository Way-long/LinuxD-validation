#!/bin/bash
# thermal device driver autotest shell-script

set -a
#set -x

$(dirname $0)/../common/kill_process.sh "cat /dev/urandom"