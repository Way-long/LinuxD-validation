#!/bin/sh
# ethernet device driver autotest shell-script

#set -x

echo "\n**********************Check class D IP ADDRESS *************************\n"

OK=0
NG=0

START="224.0.0.0"
END="239.255.255.255"

echo "Check class D ip address"

echo "set ip address $START"
ifconfig $INTERFACE $START

if [ "$?" = "1" ]; then
	 OK=$(($OK + 1))
else 
	 NG=$(($NG + 1))
fi


echo "set ip address $END"
ifconfig $INTERFACE $END

if [ "$?" = "1" ]; then
	 OK=$(($OK + 1))
else 
	 NG=$(($NG + 1))
fi

if [ "$OK" = "2" ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

# reset ipadress of board
ifconfig $INTERFACE $IPBOARD netmask 255.255.255.0
route add default gw 192.168.1.1 $INTERFACE

echo "\n************************************************************************\n"
