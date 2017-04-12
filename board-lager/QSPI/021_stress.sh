#!/bin/bash
echo "stress test"


timeout=600
# ------------------------------------- TO DO -----------------------------------
stress --cpu 2 --io 4 --vm 2 --vm-bytes 20M --timeout "$timeout"s &
sid=$!
# =========================
first="test-c.dat"
second="test-b.dat"
count=0
# 
current_time=`date +%s`
((target_time=$current_time+$timeout))
while [[ "$current_time" -le "$target_time" ]]; do
# do task
	dd if=/dev/mtd0 of="$first" bs=512 count=1000 > /dev/null 2>&1 &
	pid=$!
	dd if=/dev/mtd0 of="$second" bs=512 count=1000 > /dev/null 2>&1
	if ps -p $pid > /dev/null;then
        wait $pid
	fi
	((count++))
	if ! cmp "$first" "$second"; then
		echo -e "\nTime $count: FAILED"
		break;
	fi
	! (($count % 10)) && echo "[$$] passed $count"
# update time
	current_time=`date +%s`
done

if [[ "$current_time" -gt "$target_time" ]]; then
	echo -e "\nPASSED"
fi
# ==========================
if ps -p $sid > /dev/null;then
        echo "waiting $sid"
        wait $sid
fi

# clean up
rm "$second"
rm "$first"
