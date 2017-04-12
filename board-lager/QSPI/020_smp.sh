#!/bin/bash
echo "smp test"

cpu1_out="test-c.dat"
cpu2_out="test-b.dat"

taskset 1 dd if=/dev/mtd0 of="$cpu1_out" bs=512 count=1000 &
pid=$!
taskset 2 dd if=/dev/mtd0 of="$cpu2_out" bs=512 count=1000

if ps -p $pid > /dev/null;then
        echo "waiting $pid"
        wait $pid
fi

if cmp "$cpu1_out" "$cpu2_out"; then
	echo -e "\nPASSED"
else
	echo -e "\nFAILED"
fi

# clean up
rm "$cpu2_out"
rm "$cpu1_out"
