#!/bin/sh

set -e
#set -x

INTERFACE="eth"
OK=0
NG=0

SPEED="$1"
duplex="$2"

echo "Confirm $INTERFACE interface:"
for id in $(seq 0 20);do
	IF="$INTERFACE$id"
	if ifconfig -a | grep "$IF" > /dev/null; then
		echo "$IF"
		break
	fi
done

if [ $id -eq 20 ]; then
	echo "Has no $INTERFACE interface!"
	exit 1
fi

echo "\nSet speed: $SPEED   duplex:$duplex"
if ethtool -s $IF autoneg off speed $SPEED duplex $duplex; then
	echo "LOGS:"
	ethtool $IF
else
	echo "Setting up duplex and speed failed!"
	exit 1
fi

echo "\n"
if ethtool $IF | grep "Speed: $SPEED" > /dev/null; then
	echo "Setting Speed $SPEED ok"
	OK=$(($OK + 1))
else
	echo "Setting Speed $SPEED failed"
	NG=$(($NG + 1))
fi

if ethtool $IF | grep -io "Duplex: $duplex" > /dev/null; then
	echo "Setting Duplex $duplex ok"
	OK=$(($OK + 1))
else
	echo "Setting Duplex $duplex failed"
	NG=$(($NG + 1))
fi

echo "Passed:$OK Failed:$NG"
