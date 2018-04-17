#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*********************UP DOWN INTERFACE NETWORK**************************\n"

OK=0

# Ping the Board -> the host PC
if ping -c 10 -I $INTERFACE $GOOGLE; then
    echo "\n ping OK \n"
else
    echo "\n ping error please check again \n"
    exit 1
fi

echo "Interface $INTERFACE down:"
if ifconfig $INTERFACE down ; then
	
	if ! ping -c 10 -I $INTERFACE $GOOGLE; then
	    echo "\n ethernet set down $INTERFACE successfully \n"
	else
	    echo "\n ethernet set down $INTERFACE error \n"
	    eval $FAIL_MEG
	    exit 1
	fi
else
	eval $FAIL_MEG
    exit 1
fi

echo "Interface $INTERFACE up:"
if ifconfig $INTERFACE up > /dev/null; then

	sleep 1
	# reset ipadress of board
	ifconfig $INTERFACE $IPBOARD netmask 255.255.255.0

	sleep 1
	if ping -c 10 -I $INTERFACE $GOOGLE; then
	    echo "\n ping OK \n"
	    eval $PASS_MEG
	else
	    eval $FAIL_MEG
    	exit 1
	fi
else
	eval $FAIL_MEG
    exit 1
fi

sleep 1

echo "\n************************************************************************\n"
