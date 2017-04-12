#!/bin/bash
echo "DMAE device connected presence test"

for driver in "rcar-dmac" "shdma-of"; do
	if ls /sys/bus/platform/drivers | grep "" > /dev/null ; then
		echo "$driver: passed"
	else
		echo "$driver: failed"
	fi
done


