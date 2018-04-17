#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "\n**********************FULL DUPLEX ETHERNET TEST ETHTOOL*****************\n"

OK=0
NG=0
DUPLEX1="full"
SPEED="100"

echo "\nIn order to setup this test you need install ethtool\n"

for duplex in $DUPLEX1
do
	echo "\nTest duplex $duplex on speed $SPEED Mb/s:"
	if ethtool -s $INTERFACE autoneg on speed $SPEED duplex $duplex & sleep 5; then
		echo "Setting up duplex and speed ok"
		ethtool $INTERFACE > $LOGFILE
	else
		echo "Setting up duplex and speed failed!"
	fi

	if cat $LOGFILE | grep "Speed: $SPEED" > /dev/null; then
		echo "Setting Speed $SPEED ok"
		OK=$(($OK + 1))
	else
		echo "Setting Speed $SPEED failed"
		NG=$(($NG + 1))
	fi

	if cat $LOGFILE | grep "Duplex: $dx" > /dev/null; then
        echo "Setting Duplex $dx ok"
		OK=$(($OK + 1))
	else
        	echo "Setting Duplex $dx failed"
		NG=$(($NG + 1))
	fi

	echo "`cat $LOGFILE`"

	if [ -f $LOGFILE ]; then 
		rm $LOGFILE
	fi

done

if [ "$OK" = "2" ]; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi	

echo "\n************************************************************************\n"
