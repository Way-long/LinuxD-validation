#!/bin/bash

echo "test stress"

DEVICE="/dev/mmcblk0p1"
TIME=1800

devDir="/mnt/mmc"
ram="/tmp/temp"

MK_NEW_DIR="$(dirname $0)/../common/mk_new_folder.sh"
UMOUNT_DIR="$(dirname $0)/../common/remove_dev_dir.sh"

#create new directory to mount
$MK_NEW_DIR "$devDir"
$MK_NEW_DIR "$ram"

#mount device
mount $DEVICE "$devDir"
#mount ram
mount -t tmpfs -o size=450M tmpfs "$ram"


echo "create file 128MB in RAM"
rfile="$ram/f128m.txt"
dd if=/dev/urandom of="$rfile" bs=1M count=128  > /dev/null 2>&1

echo "do stress"
stress --cpu 2 --io 4 --vm 2 --vm-bytes 20M --timeout "$TIME"s &
pid=$!

echo "do write while be stressed"
ERROR=false
cnt=0
dfile=$devDir/f134m
dd if="$rfile"  of="$dfile.${cnt}" bs=4096 count=32768 > /dev/null 2>&1
test_end=$(($(date +%s) + $TIME))
while [ $test_end -gt $(date +%s) ] ; do 
	icnt=${cnt}; 
	ocnt=$((${cnt}+1)); 
	dd if=$dfile.${icnt} of=$dfile.${ocnt} bs=4096 count=32768 > /dev/null 2>&1
	IN_SUM=$(sha256sum "$dfile.${icnt}" | cut -f 1 -d ' ')
	OUT_SUM=$(sha256sum "$dfile.${ocnt}" | cut -f 1 -d ' ')
	if [ "$IN_SUM" != "$OUT_SUM" ]; then
		echo "Data read does not match data written at time $cnt" >&2
		echo "SHA 256 Checksums:" >&2
		echo "    in:  $IN_SUM" >&2
		echo "    out: $OUT_SUM" >&2
		ERROR=true
	fi
	rm $dfile.${icnt}
	cnt=${ocnt};
done
echo "finish in $cnt times"
# time up
if ps -p $pid > /dev/null;then
	echo "waiting $pid"
	wait $pid
fi

echo -e "\nCompare data writen to data read"

IN_SUM=$(sha256sum "$rfile" | cut -f 1 -d ' ')
OUT_SUM=$(sha256sum "$dfile.${cnt}" | cut -f 1 -d ' ')
if [ "$IN_SUM" != "$OUT_SUM" ]; then
	echo "Data read does not match data written" >&2
	echo "SHA 256 Checksums:" >&2
	echo "    in:  $IN_SUM" >&2
	echo "    out: $OUT_SUM" >&2
	ERROR=true
fi

$ERROR && echo -e "\nFAILED" || echo -e "\nPASSED"

# clean up
for f in $dfile*; do
	rm $f
done

#umount and remove
$UMOUNT_DIR "$devDir"
$UMOUNT_DIR "$ram"

