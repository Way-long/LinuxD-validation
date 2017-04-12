#!/bin/bash
echo "set message level"


MSGLV1="0xfffff000"
MSGLV2="0x000000cc"

echo -e "\nset level $MSGLV1"
ethtool -s eth0 msglvl $MSGLV1
if ethtool eth0 | grep -i "current message level" | grep -i "$MSGLV1"; then
	echo "PASSED"
else
	echo "FAILED"
fi

sleep 1

echo -e "\nset level $MSGLV2"
ethtool -s eth0 msglvl $MSGLV2
if ethtool eth0 | grep -i "current message level" | grep -i "$MSGLV2"; then
	echo "PASSED"
else
	echo "FAILED"
fi