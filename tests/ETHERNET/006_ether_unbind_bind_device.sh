#!/bin/sh
# ethernet device driver autotest shell-script

set -a
#set -x

echo "\n*******************UNBIND BIND ETHERNET DRIVER TEST*********************\n"

if ! $(dirname $0)/../common/unbind-bind.sh "$DRIVER" "$ETH_INTERRUPT";then
    echo -e "TEST FAILED"
    exit 1
fi

sleep 5

. $(dirname $0)/seting_ethernet.sh

sleep 5

if ping -c 5 -I $INTERFACE $GOOGLE; then
    eval $PASS_MEG
else
    eval $FAIL_MEG
fi

echo "\n************************************************************************\n"
