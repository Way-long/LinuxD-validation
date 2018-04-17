#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*********************PING GOOGLE SITE NETWORK *****************************\n"

# Ping the Board -> the host PC
if ping -c 5 -I $INTERFACE $GOOGLE; then
    eval $PASS_MEG
else
    eval $FAIL_MEG
fi

echo "\n***************************************************************************\n"