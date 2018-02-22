#!/bin/bash
# usb function device driver autotest shell-script

set -e
#set -x

$CMD_SSH <<ENDSSH

stress --cpu $CPU_NUMBER --io $(($CPU_NUMBER + $CPU_NUMBER)) --vm $CPU_NUMBER --vm-bytes 20M --timeout 3600s &

ENDSSH
