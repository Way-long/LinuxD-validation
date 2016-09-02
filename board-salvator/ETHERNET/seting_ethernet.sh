#!/bin/sh
# ethernet device driver autotest shell-script

set -a
#set -x

cmd="ifconfig $INTERFACE $IPBOARD netmask $NETMASK"
echo $cmd

eval $cmd

cmd="route add default gw $GATEWAY $INTERFACE"
echo $cmd

eval $cmd