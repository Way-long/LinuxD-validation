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

if cat $LOGFILE | grep "driver: $INTEL_PCI_DRIVER" > /dev/null ; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

echo "check interrupt"
if cat $LOGFILE | grep "bus-info: $INTEL_PCI_BUS_INFO" > /dev/null; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

echo "check support"
if cat $LOGFILE | grep "supports-statistics: yes" > /dev/null; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

if cat $LOGFILE | grep "supports-test: yes" > /dev/null; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

if cat $LOGFILE | grep "supports-eeprom-access: yes" > /dev/null; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

if cat $LOGFILE | grep "supports-register-dump: yes" > /dev/null; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

if cat $LOGFILE | grep "supports-priv-flags: no" > /dev/null; then
	OK=$(($OK + 1))
else
	NG=$(($NG + 1))	
fi

rm -f $LOGFILE

if [ "$OK" = "8" ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG	
fi

echo "\n************************************************************************\n"