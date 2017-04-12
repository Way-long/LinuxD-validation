#!/bin/bash
echo "smp test"

for i in {0..9} ; do
	! grep -Fxq "1" "/sys/devices/system/cpu/cpu${i}/online" > /dev/null 2>&1 && continue
	# --------------------------------------------------------
	taskset -c "$i" $(dirname $0)/tftp_eth.sh -timeout 300 &
	cpu[$i]=$!
done

RET=0
echo "[$$]> wait all processes to finish"
for i in {0..9} ; do
	[[ "${cpu[i]}" ]] && { wait "${cpu[i]}" || { echo "ERROR: process ${cpu[i]} fail";RET=1; } }
done

[[ "$RET" == "0" ]] && echo "PASSED"
