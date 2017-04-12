#!/bin/bash
# set -x
# constant
MOUNT="$(dirname $0)/mount_helper.sh"
UMOUNT="$(dirname $0)/../common/remove_dev_dir.sh"
# arguments
dev=$1
blkcnt=100
block=1M
do_times=5
# option
phelp(){
	echo "usage: $(basename $0) dev_mount_folder [option]"
	echo "dev_mount_folder: /mnt/sd0, /tmp/hd, ..."
	echo "options:"
	echo "-bcnt: block count (50, 100, ...).default 100"
	echo "-blk: block (1M, 2M, ...).default 1M"
	echo "-direct: dismiss mounting step"
	echo "-times: doing times (1, 50, 100, ...).default 5"
}
i=1
while [[ "$i" -le "$#" ]]; do
	if [[ ${!i} == "-direct" ]];then direct=true; 
	fi
	if [[ ${!i} == "-bcnt" ]];then ((i++)); blkcnt=${!i}; 
	fi
	if [[ ${!i} == "-blk" ]];then ((i++)); block=${!i}; 
	fi
	if [[ ${!i} == "-times" ]];then ((i++)); do_times=${!i}; 
	fi
	
	if [[ ${!i} == "-h" ]];then ((i++)); phelp;exit 0; fi
	# --------------------------
	((i++))
done
# -------------------------------------  TO DO  ------------------------------------
if [[ ! -n "$direct" ]]; then
	$MOUNT "$dev"
fi
$(dirname $0)/../common/create_random_file.sh "/tmp/cache" -bcnt $blkcnt -blk $block

for i in {0..9} ; do
	! grep -Fxq "1" "/sys/devices/system/cpu/cpu${i}/online" > /dev/null 2>&1 && continue
	# --------------------------------------------------------
	echo "[$$]> do task in CPU$i"	
	taskset -c "$i" $(dirname $0)/write_helper.sh "$dev" -rw -times "$do_times" -direct -blk "$block" -bcnt "$blkcnt" -src "/tmp" &	
	cpu[$i]=$!
done

RET=0
echo "[$$]> wait all processes to finish"
for i in {0..9} ; do
	[[ "${cpu[i]}" ]] && { wait "${cpu[i]}" || { echo "ERROR: process ${cpu[i]} fail";RET=1; } }
done

[[ "$RET" == "0" ]] && echo -e "\nPASSED"


# clean up
if [[ ! -n "$direct" ]]; then
	$UMOUNT "$dev"
fi

exit $RET
