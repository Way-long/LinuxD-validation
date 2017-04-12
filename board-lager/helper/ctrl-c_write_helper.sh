#!/bin/bash

# constant
MOUNT="$(dirname $0)/mount_helper.sh"
UMOUNT="$(dirname $0)/../common/remove_dev_dir.sh"
# arguments
dev=$1
blkcnt=40
block=1M
# option
phelp(){
	echo "usage: $(basename $0) dev_mount_folder [option]"
	echo "dev_mount_folder: /mnt/sd0, /tmp/hd, /mnt/ram ..."
	echo "options:"
	echo "-bcnt: block count (1, 10, ...).default 10"
	echo "-blk: block (1M, 2M, ...).default 1M"
	echo "-direct: dismiss mounting step"
}
i=1
while [[ "$i" -le "$#" ]]; do
	if [[ ${!i} == "-direct" ]];then direct=true; 
	fi
	if [[ ${!i} == "-bcnt" ]];then ((i++)); blkcnt=${!i}; 
	fi
	if [[ ${!i} == "-blk" ]];then ((i++)); block=${!i}; 
	fi

	if [[ ${!i} == "-h" ]];then ((i++)); phelp;exit 0; 
	fi
	# --------------------------
	((i++))
done
# -------------------------------------  TO DO  ------------------------------------
RET=0
if [[ ! -n "$direct" ]]; then
	$MOUNT "$dev"
fi

target_file=$(mktemp -p $dev/)
cmd="dd if=/dev/urandom of=$target_file bs=$block count=$blkcnt"

echo "[$$]> start writing process"
{
	echo "[$BASHPID]> start write"
	$cmd
	code=$?
	if [[ "$code" == "0" ]]; then
		echo "[$BASHPID] ERROR: writing process is not interrupted"
		exit 2
	elif [[ "$code" == "130" ]]; then
		echo "[$BASHPID] writing process is interrupted successfully"
	else
		echo "[$BASHPID] writing process is interrupted ??? (return code: $code)"
	fi
	exit 0
}&
pid=$!
sleep 3.5
# ps -aux | grep "$cmd"
log=`pgrep -x "dd" | xargs --no-run-if-empty ps fp | grep "$cmd"`
intPID=`echo "$log" | awk '{print $1}'`
echo "[$$]> interrupt process"
kill -INT $intPID || echo "ERROR: interrupt failed"
sleep 5
if ps -p $intPID > /dev/null;then
	echo "ERROR: dd process [$intPID] still running"
	RET=1
fi

wait $pid || RET=$?
fsize=`$(dirname $0)/../common/size_of.sh "$target_file"`
echo "size of $blkcnt*$block file after interrupted: $fsize ($(du -h $1 | awk '{print $1}'))"

[[ "$RET" == "0" ]] && echo -e "\nPASSED"

# clean up
rm $target_file

if [[ ! -n "$direct" ]]; then
	$UMOUNT "$dev"
fi

# 
exit $RET