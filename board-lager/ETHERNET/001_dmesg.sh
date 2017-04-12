#!/bin/sh

set -e
#set -x

INTERFACE="eth"
# Confirm eth interface:
echo "Confirm $INTERFACE interface on board:"
for id in $(seq 0 20);
do
        IF="$INTERFACE$id"
        if ifconfig -a | grep "$IF" > /dev/null; then
                echo "$IF"
                break
        fi
done

if [ $id -eq 20 ]; then
        echo "FAILED: Has no $INTERFACE interface!"
        exit 1
fi

echo "\nLOGS:"
dmesg | grep "$IF"

PATTERN="Link is Up"

if ! dmesg | grep "$IF" | grep "$PATTERN" > /dev/null; then
	echo "\n FAILED: not matched" >&2
	exit 1
else 
	echo "\n PASSSED"
fi
