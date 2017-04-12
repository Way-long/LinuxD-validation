#!/bin/bash
# set -x

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
	echo "-bcnt: block count (1, 50, ...).default 10"
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

from=$(mktemp -p /tmp/)
$(dirname $0)/../common/create_random_file.sh "$from" -bcnt "$blkcnt" -blk "$block"
to=$(mktemp -p $dev/)
cmd="dd if=$from of=$to bs=128" 

echo "[$$]> start writing process"
{
	echo "[$BASHPID]> start write"
	$cmd
	exit $?
}&
wrapperPID=$!
sleep 3
log=`pgrep -x "dd" | xargs --no-run-if-empty ps fp | grep "$cmd"`
pid=`echo "$log" | awk '{print $1}'`
echo "[$$]> pause process"
kill -TSTP $pid || echo "ERROR: pause failed (pid = $pid)"
sleep 5
# check
pstat=`ps -up $pid | grep $pid | awk '{print $8}'`
[[ "$pstat" == "T"* ]] && echo "process paused (state = $pstat)" || echo "ERROR: process state is $pstat"
fsize=`$(dirname $0)/../common/size_of.sh "$to"`
echo "file size at paused time: $fsize"
sleep 5
fsize1=`$(dirname $0)/../common/size_of.sh "$to"`
echo "file size after 5 seconds from paused time: $fsize1"
[[ "$fsize" == "$fsize1" ]] || echo "ERROR: process still running"
echo "[$$]> resume process"
kill -CONT $pid || echo "ERROR: restart failed (pid = $pid)"
wait $wrapperPID || echo "ERROR: error code returned ($?)"
fsize2=`$(dirname $0)/../common/size_of.sh "$to"`
echo "file size after copy finished: $fsize2"

cmp "$from" "$to" &&  echo -e "\nPASSED" || echo -e "\nFAILED"

# clean up
rm "$from"
rm "$to"


if [[ ! -n "$direct" ]]; then
	$UMOUNT "$dev"
fi