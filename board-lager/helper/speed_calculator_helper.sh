#!/bin/bash

# arguments
dev=$1
src="/mnt/ram"
file_size=350

# option
phelp(){
	echo "usage: $(basename $0) dev_mount_folder [option]"
	echo "dev_mount_folder: /mnt/sd0, /tmp/hd, /mnt/ram ..."
	echo "options:"
	echo "-src: source folder (default: /mnt/ram)"
	echo "-fsize: file size (in megabite, default: 350)"
	echo "-read: read mode"
	echo "-log: print all step log"
}
i=1
while [[ "$i" -le "$#" ]]; do
	if [[ ${!i} == "-src" ]];then ((i++)); src=${!i}; fi
	if [[ ${!i} == "-fsize" ]];then ((i++)); file_size=${!i}; fi
	if [[ ${!i} == "-read" ]];then mode_read=true; fi
	if [[ ${!i} == "-h" ]];then ((i++)); phelp;exit 0; fi
	if [[ ${!i} == "-log" ]];then
		export CMD_POSITION="root@linaro-nano:~# "
		export LOG_CMD=true
	fi
	((i++))
done
# declaration
p(){
	if [[ ! -n $LOG_CMD ]]; then
		echo "$1"
	fi
}
getSecond(){
	log=$1
	ltime=$(cat "$log" | grep -i "real" | awk '{print $2}')	
	minute=$(echo $ltime | cut -d m -f1 )
	second=$(echo $ltime | cut -d m -f2 | cut -d s -f1)
	total=$(echo $minute $second | awk '{print $1*60+$2}')
	echo $total
}
# constant
MOUNT="$(dirname $0)/mount_helper.sh"
UMOUNT="$(dirname $0)/../common/remove_dev_dir.sh"
CMD="$(dirname $0)/../common/cmd.sh"
# -------------------------------   TO DO   ------------------------------------------
# initialize
for cpu in "/sys/devices/system/cpu/cpu"[0-9]"/cpufreq/scaling_governor" ; do
	$CMD "echo performance > '$cpu'"
done
$MOUNT "$src"
$MOUNT "$dev"

if [[ ! -n "$mode_read" ]]; then
	# write mode
	p "create file ${file_size}MB on [$src]"
	$CMD "dd if=/dev/urandom of='$src/file' bs=1M count=$file_size"
	p "do copy"
	cp_cmd="time cp '$src/file' '$dev'"
else
	# read mode
	p "create file ${file_size}MB on [$dev]"
	$CMD "dd if=/dev/urandom of='$dev/file' bs=1M count=$file_size"
	p "do copy"
	cp_cmd="time cp '$dev/file' '$src'"
fi

umnt_cmd="time umount '$dev'"

# do copy
log_copy="$src/1.cache"
log_umount="$src/2.cache"

count=1
for cmd in "$cp_cmd" "$umnt_cmd" ; do
	log="$src/$count.cache"
	if [[ -n $LOG_CMD ]]; then
		echo "$CMD_POSITION$cmd"
		bash -c "$cmd" 2>&1 | tee $log
	else
		bash -c "$cmd" 2> $log 
	fi
	((count++))
done

# calculate
ctime=`getSecond "$log_copy"`
utime=`getSecond "$log_umount"`
speed=$(echo $file_size $ctime $utime | awk '{print $1/($2+$3)}')

# clean up
$CMD "rm -r '$dev'"

#umount and remove
$UMOUNT "$src"

# print result
echo -e "\nFile size: $file_size MB"
echo "Copy time: $ctime second"
echo "Umount time: $utime second"
echo "Speed: $speed MB/s"