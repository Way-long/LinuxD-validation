#!/bin/sh

set -e
#set -x

file1="test1.dat"
file2="test2.dat"
data_size="512"

echo "format mtd2 partition"
flash_erase -q -j /dev/mtd2 0 0

echo "read data from mtd2"
dd if=/dev/mtd2 of=$file1 bs=512 count=1

echo "read data from mtdblock2"
dd if=/dev/mtdblock2 of=$file2 bs=512 count=1

if diff $file1 $file2 ; then
        echo "TEST PASSED"
else
        echo "Test has not passed"
fi

rm -r $file1
rm -r $file2
