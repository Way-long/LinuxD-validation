#! /bin/bash
#Creating partition and making file system for card 

echo "Make ext3 file system for partion MMCIF"
mkfs.ext3 /dev/mmcblk0p1 > /dev/null 2>&1

if [ ! -e "/dev/mmcblk0p1" ]; then
   echo "create partition  FAILED"
else
   echo "create partition  PASSED"	
fi















