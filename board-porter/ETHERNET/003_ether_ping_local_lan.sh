#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*********************PING LOCAL LAN NETWORK *******************************\n"

# Ping the Board -> the host PC
if ping -c 5 -I $INTERFACE $IPSERVER; then
    eval $PASS_MEG
else
    eval $FAIL_MEG
fi

echo "\n***************************************************************************\n"