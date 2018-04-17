#!/bin/sh
# pciec device driver autotest shell-script

set -e
#set -x

echo "\n*********************PING GOOGLE SITE NETWORK **************************\n"

# Ping the Board -> the host PC
if ping -c 20 -I $L_INTERFACE_PCIE -s 100 $IPBOARD_PCIE; then
    eval $PASS_MEG
else
    eval $FAIL_MEG
fi

echo "\n************************************************************************\n"
