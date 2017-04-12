#!/bin/bash

# constant
MOUNT="$(dirname $0)/mount_helper.sh"
UMOUNT="$(dirname $0)/../common/remove_dev_dir.sh"
PREPARE_DATA="$(dirname $0)/../common/create_random_file.sh"
MODE_W="write"
MODE_R="read"
MODE_RW="read+write"
MODE_SMP="smp"
# arguments
dev=$1
src="/mnt/ram"
blkcnt=350
block=1M
do_times=1
mode="$MODE_W"
# option
phelp(){
	echo "usage: $(basename $0) dev_mount_folder [option]"
	echo "dev_mount_folder: /mnt/sd0, /tmp/hd, /mnt/ram ..."
	echo "options:"
	echo "-bcnt: block count (50, 100, ...).default 350"
	echo "-src: source folder (/mnt/ram, sd, ...).default /mnt/ram"
	echo "-blk: block (1M, 2M, ...).default 1M"
	echo "-read: read only"
	echo "-rw: read and write"
	echo "-smp: read and write simultaneously"
	echo "-times: doing times (1, 50, 100, ...).default 1"
	echo "-direct: dismiss mounting step"
	echo "-hasdata: prepare data on device before writing"
}
i=1
while [[ "$i" -le "$#" ]]; do
	if [[ ${!i} == "-rw" ]];then mode="$MODE_RW";
	fi
	if [[ ${!i} == "-read" ]];then mode="$MODE_R"; 
	fi
	if [[ ${!i} == "-smp" ]];then mode="$MODE_SMP"; hasData=true;
	fi
	if [[ ${!i} == "-direct" ]];then direct=true; 
	fi
	if [[ ${!i} == "-hasdata" ]];then hasData=true; 
	fi
	if [[ ${!i} == "-src" ]];then ((i++)); src=${!i}; 
	fi
	if [[ ${!i} == "-bcnt" ]];then ((i++)); blkcnt=${!i}; 
	fi
	if [[ ${!i} == "-blk" ]];then ((i++)); block=${!i}; 
	fi
	if [[ ${!i} == "-times" ]];then ((i++)); do_times=${!i}; 
	fi

	if [[ ${!i} == "-h" ]];then ((i++)); phelp;exit 0; 
	fi
	((i++))
done
# -------------------------------------  TO DO  ------------------------------------
RET=0
if [[ ! -n "$direct" ]]; then
	$MOUNT "$src"
	$MOUNT "$dev"
fi

if [[ -n "$hasData" ]]; then
	data=$(mktemp -p $dev/)
	[[ "$mode" == "$MODE_SMP" ]] && $PREPARE_DATA $data -bcnt $blkcnt -blk $block || $PREPARE_DATA $data -bcnt 50
fi

[[ "$mode" == "$MODE_R" ]] && from=$(mktemp -p $dev/) || from=$(mktemp -p $src/)
$PREPARE_DATA $from -bcnt $blkcnt -blk $block

# write test
echo "[$$]> transfer data between [$src] and [$dev] in mode <$mode> $do_times times"
count=0
while true; do
	if [[ "$mode" == "$MODE_RW" ]]; then
		w=$(mktemp -p $dev/)
		r=$(mktemp -p $src/)
		cp "$from" "$w"
		sync
		cp "$w" "$r"
		sync
		cmp $from $r || break
		rm $w
		rm $r
	elif [[ "$mode" == "$MODE_SMP" ]]; then
		w=$(mktemp -p $dev/)
		r=$(mktemp -p $src/)
		cp "$data" "$r" &
		pid=$!
		cp "$from" "$w"
		# wait all process to finish
		if ps -p $pid > /dev/null;then
			echo "waiting $pid"
			wait $pid
		fi
		sync
		cmp "$from" "$w" || break
		cmp "$data" "$r" || break
		rm $w
		rm $r
	else
		if [[ "$mode" == "$MODE_R" ]]; then
			to=$(mktemp -p $src/)
		else
			to=$(mktemp -p $dev/)
		fi
		cp "$from" "$to"
		sync
		cmp $from $to || break
		rm $to
	fi

	((count++))
	[[ "$count" -ge "$do_times" ]] && break
	! (($count % 10)) && echo "[$$] passed $count/$do_times"
done

[[ "$count" -ge "do_times" ]] && echo -e "\n[$$] PASSED" || { echo -e "\n[$$] FAILED: $count/$do_times"; RET=1; }

# clean up
rm "$from"
[[ -n "$hasData" ]] && rm "$data"


if [[ ! -n "$direct" ]]; then
	#umount and remove
	$UMOUNT "$src"
	$UMOUNT "$dev"
fi

# 
exit $RET