#!/bin/sh
# pciec device driver autotest shell-script

set -e
#set -x

echo "\n*****************************CHECK DMESG ETHTOOL************************\n"

OK=0
NG=0

echo "\nIn order to setup this test you need install ethtool\n"

ethtool -i $INTERFACE >> $LOGFILE

echo "check driver"

if cat $LOGFILE | grep "driver: $PCI_DRIVER" > /dev/null ; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

echo "check interrupt"
if cat $LOGFILE | grep "bus-info: $PCI_BUS_INFO" > /dev/null; then
	OK=$(($OK + 1))
else
	echo "check interrupt bus-info: $PCI_BUS_INFO NG"
	NG=$(($NG + 1))	
fi

echo "check support"
if cat $LOGFILE | grep "supports-statistics: yes" > /dev/null; then
	OK=$(($OK + 1))
else
	echo "check support supports-statistics: yes NG"
	NG=$(($NG + 1))	
fi

if cat $LOGFILE | grep "supports-test: no" > /dev/null; then
	OK=$(($OK + 1))
else
	echo "check support supports-test: no NG"
	NG=$(($NG + 1))	
fi

if cat $LOGFILE | grep "supports-eeprom-access: no" > /dev/null; then
	OK=$(($OK + 1))
else
	echo "check support supports-eeprom-access: no NG"
	NG=$(($NG + 1))	
fi

if cat $LOGFILE | grep "supports-register-dump: yes" > /dev/null; then
	OK=$(($OK + 1))
else
	echo "check support supports-register-dump: yes NG"
	NG=$(($NG + 1))	
fi

if cat $LOGFILE | grep "supports-priv-flags: no" > /dev/null; then
	OK=$(($OK + 1))
else
	echo "check support supports-priv-flags: no NG"
	NG=$(($NG + 1))	
fi

rm -f $LOGFILE

if [ "$OK" = "7" ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG	
fi

echo "\n************************************************************************\n"
