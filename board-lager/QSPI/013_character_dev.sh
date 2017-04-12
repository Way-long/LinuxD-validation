#!/bin/sh

set -a
#set -x

echo "create folder test"
mkdir -p /mnt/media	
mkdir -p ./test-char


echo "create file txt in ./test-char"
# dd if=/dev/urandom of=./test-char/data bs=1M count=10
echo abcdefghiklm > ./test-char/test1.txt
echo 123456789 > ./test-char/test2.txt

echo "create file image.jffs2"
mkfs.jffs2 -r ./test-char -o image.jffs2
flash_erase -j /dev/mtd2 0 0
flashcp image.jffs2 /dev/mtd2

echo "mount system file jffs2"
mount -t jffs2 /dev/mtdblock2 /mnt/media

if diff -r ./test-char /mnt/media ; then
        echo "TEST PASSED"
else
        echo "Test has not passed"
fi

#umount device
umount /mnt/media

sleep 3
rm -r /mnt/media

sleep 3
rm -r ./test-char

mkfs.ext3 /dev/mtdblock2 > /dev/null

