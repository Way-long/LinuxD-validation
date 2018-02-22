#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n*****************************CHECK DMESG ETHTOOL************************\n"

OK=0
NG=0

echo "\nIn order to setup this test you need install ethtool\n"

ethtool -i $INTERFACE >> $LOGFILE

echo "check driver"

if cat $LOGFILE | grep "driver: $DRIVER" > /dev/null ; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

echo "check interrupt"
if cat $LOGFILE | grep "bus-info: $ETH_INTERRUPT" > /dev/null; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

echo "check support"
if cat $LOGFILE | grep "supports-statistics" > /dev/null; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

if cat $LOGFILE | grep "supports-test" > /dev/null; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

if cat $LOGFILE | grep "supports-eeprom-access" > /dev/null; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

if cat $LOGFILE | grep "supports-priv-flags" > /dev/null; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

if cat $LOGFILE | grep "supports-register-dump" > /dev/null; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

rm -f $LOGFILE

if [ "$OK" = "7" ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG	
fi

echo "\n************************************************************************\n"