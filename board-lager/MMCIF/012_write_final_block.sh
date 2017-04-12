#!/bin/bash

echo "checking out of border access"

DEVICE=/dev/mmcblk0
PARTITION=/dev/mmcblk0p1

function getInterruptCount {
	IRQ="$1"
	IRQ=${IRQ%% [A-Za-z]*}
	IRQ=${IRQ#* }
	echo $IRQ   
}
# ----------------------------TO DO----------------------------------------
line=`fdisk -l  $DEVICE | grep $PARTITION`
line=`getInterruptCount "$line"`
start=(${line// / })
end=$(echo "$line" | awk '{print $2}')
count=1
((seek = $end - $start + 1))
echo "START: $start"
echo "END: $end"
echo "SIZE: $count"
echo "SEEK: $seek"
echo "No space left"

if dd if=/dev/zero of=/dev/mmcblk0p1 bs=512 count=$count seek=$seek 2>&1 | grep -i "no space left" > /dev/null ;then
	echo -e "\nPASSED"
else
	echo -e "\nFAILED"
fi

mkfs.ext3 $PARTITION > /dev/null 2>&1