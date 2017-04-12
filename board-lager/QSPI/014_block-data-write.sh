#!/bin/sh

set -e
#set -x

#create folder test
echo "create /mnt/media"
mkdir -p /mnt/media	


#format flash_erase
flash_erase -j /dev/mtd2 0 0

#create file image.jffs2
mount -t jffs2 /dev/mtdblock2 /mnt/media

#create file test 
echo "create file 20MB"
dd if=/dev/mtdblock2 of=test.dat bs=1M count=20

#cpy file test in mtdblock2
echo "copy file 20MB to /dev/mtdblock2"
cp test.dat /mnt/media

#umount device
umount /mnt/media

#remount decive 
mount -t jffs2 /dev/mtdblock2 /mnt/media

if diff test.dat /mnt/media/test.dat ; then
        echo "TEST PASSED"
else
        echo "Test has not passed"
fi

sleep 5
echo "umount device"
#umount and remove file test
rm /mnt/media/test.dat
sleep 3
umount /mnt/media
sleep 3
rmdir /mnt/media

mkfs.ext3 /dev/mtdblock2 > /dev/null