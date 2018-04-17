#!/bin/sh
# pciec device driver autotest shell-script

set -e
#set -x

if [ $# -lt 2 ]; then
    echo "use more parameter"
    echo "usage : $(basename $0) SPEED DUPLEX (AUTONEG)"
    exit 1
fi

PARAMS=$2

if [ -z "$3" ];then
    cmd="ethtool -s $INTERFACE speed $1 duplex $2"
else
    cmd="ethtool -s $INTERFACE speed $1 duplex $2 autoneg $3"
fi

echo $cmd

eval $cmd

#wating 5s for system setting
sleep 5

ethtool $INTERFACE

if ! ethtool $INTERFACE | grep "Speed: ${1}Mb/s" > /dev/null ; then
    echo "Speed change failed"
    exit 1
fi

if ! ethtool $INTERFACE | grep -i "Duplex: $PARAMS" > /dev/null; then
    echo "Duplex change failed"
    exit 1 
fi

if ! [ -z "$3" ];then
    if ! ethtool $INTERFACE | grep "Auto-negotiation: $3" > /dev/null; then
        echo "Autoneg change failed"
        exit 1 
    fi
fi    

# Ping
cmd="ping -I $INTERFACE -c 10 -s 100 $GOOGLE"
echo $cmd

if eval $cmd; then
	echo "Ping to GOOGLE site 100: OK"
    #reset parameter
    ethtool -s $INTERFACE autoneg on speed 100 duplex full
else
	echo "Ping to GOOGLE site 100: Failed"
    #reset parameter
    ethtool -s $INTERFACE autoneg on speed 100 duplex full
    exit 1
fi
