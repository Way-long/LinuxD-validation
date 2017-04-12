#!/bin/bash

set -e
#set -x

file_size=$5
src1=$1
des1=$2
src2=$3
des2=$4




file1="dumy1.dat"
file2="dumy2.dat"

echo "prepare data on [$src1] and [$src2]"
dd if=/dev/urandom of="$src1/$file1" bs=1M count=$file_size  > /dev/null 2>&1
dd if=/dev/urandom of="$src2/$file2" bs=1M count=$file_size  > /dev/null 2>&1

echo "do copy simultenously from [$src1] to [$des1] and from [$src2] to [$des2]"
cp "$src1/$file1" "$des1" &
pid=$!
cp "$src2/$file2" "$des2"

# wait all process to finish
if ps -p $pid > /dev/null;then
	echo "waiting $pid"
	wait $pid
fi

echo "testing...."
if cmp "$des1/$file1" "$src1/$file1" && cmp "$des2/$file2" "$src2/$file2" ;then
    echo -e "\nPASSED"
else
    echo -e "\nFAILED"
fi

#clean up
rm "$src1/$file1"
rm "$src2/$file2"
rm "$des1/$file1"
rm "$des2/$file2"
