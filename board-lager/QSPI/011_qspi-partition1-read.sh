#!/bin/sh

set -e
#set -x

file1="test1.dat"
file2="test2.dat"
data_size="512"

echo "read data from mtd1"
dd if=/dev/mtd1 of=$file1 bs=$data_size

echo "read data from mtdblock1"
dd if=/dev/mtdblock1 of=$file2 bs=$data_size

if diff $file1 $file2 ; then
        echo "TEST PASSED"
else
        echo "Test has not passed"
fi

rm -r $file1
rm -r $file2
