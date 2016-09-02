#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n**********************ETHTOOL CHECK MESSAGE LEVEL***********************\n"

OK=0
NG=0
MSGLV1="0xffff8000"
MSGLV2="0x000000cc"
FILE1="/tmp/ethtool1"
FILE2="/tmp/ethtool2"

echo "check update message level"

ethtool -s $INTERFACE msglvl $MSGLV1
ethtool $INTERFACE > $LOGFILE

cat $LOGFILE | grep "Current message level" > /dev/null

if cat $LOGFILE | grep $MSGLV1 > /dev/NULL; then
	echo "check update passed"
	echo "TEST MSGLV1 PASSED "
	OK=$(($OK + 1))
else
	echo "check update failed"
	NG=$(($NG + 1))
fi

rm -rf $LOGFILE

sleep 2

ethtool -s $INTERFACE msglvl $MSGLV2
ethtool $INTERFACE > $LOGFILE

cat $LOGFILE | grep "Current message level" > $FILE2

if cat $LOGFILE | grep $MSGLV2 > /dev/NULL; then
	echo "check update passed"
	echo "TEST MSGLV2 PASSED"
	OK=$(($OK + 1))
else
	echo "check update failed"
	NG=$(($NG + 1))
fi

if [ "$OK" = "2" ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG	
fi

rm -rf $LOGFILE

echo "\n************************************************************************\n"