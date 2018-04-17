#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n**********************Check class A IP ADDRESS *************************\n"

OK=0
NG=0

START="0.0.0.0"
END="191.255.255.255"

echo "Check class A ip address"

echo "set ip address $START"
ifconfig $INTERFACE $START

ip_address=`/sbin/ifconfig $INTERFACE | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

if [ "$ip_address" = "" ]; then
	 OK=$(($OK + 1))
else 
	 NG=$(($NG + 1))
fi


echo "set ip address $END"
ifconfig $INTERFACE $END

ip_address=`/sbin/ifconfig $INTERFACE | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`

if [ "$ip_address" = "$END" ]; then
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