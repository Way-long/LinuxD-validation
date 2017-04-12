#!/bin/sh
echo "checking by dmesg"

for drv in "ee100000.sd" "ee140000.sd";do
	echo ""
	cat /proc/interrupts | grep $drv && echo "PASSED" || echo "FAILED"
done

