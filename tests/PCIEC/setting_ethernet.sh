#!/bin/sh
# ethernet device driver autotest shell-script

set -a
#set -x

cmd="ifconfig $INTERFACE $IPBOARD_PCIE netmask $NETMASK"
echo $cmd

eval $cmd
