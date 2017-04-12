#!/bin/sh
echo "checking by dmesg"

for drv in "ee100000.sd" "ee140000.sd";do
	echo ""
	dmesg | grep -i sdhi | grep "mmc" | grep "$drv" && echo "PASSED" || echo "FAILED"
done