#!/bin/bash

# constant
MOUNT="$(dirname $0)/mount_helper.sh"
UMOUNT="$(dirname $0)/../common/remove_dev_dir.sh"
# arguments
dev=$1
blkcnt=100
block=1M
do_times=20
stress_time=600s
# option
phelp(){
	echo "usage: $(basename $0) dev_mount_folder [option]"
	echo "dev_mount_folder: /mnt/sd0, /tmp/hd, ..."
	echo "options:"
	echo "-bcnt: block count (50, 100, ...).default ${blkcnt}"
	echo "-blk: block (1M, 2M, ...).default ${block}"
	echo "-direct: dismiss mounting step"
	echo "-times: doing times (1, 50, 100, ...).default ${do_times}"
	echo "-stress: stress time (1s, 60s, 3600s, ...).default ${stress_time}"
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
	if [[ ${!i} == "-stress" ]];then ((i++)); stress_time=${!i}; 
	fi
	
	if [[ ${!i} == "-h" ]];then ((i++)); phelp;exit 0; fi
	# --------------------------
	((i++))
done
# -------------------------------------  TO DO  ------------------------------------
$(dirname $0)/../common/do_stress.sh "$stress_time" &
pid=$!

if [[ ! -n "$direct" ]]; then
	$MOUNT "$dev"
fi
$(dirname $0)/write_helper.sh "$dev" -rw -times "$do_times" -direct -blk "$block" -bcnt "$blkcnt" -src "/tmp"
RET=$?

if ps -p $pid > /dev/null;then
	echo "waiting stress process"
	wait $pid
fi
[[ "$RET" == "0" ]] && echo -e "\nPASSED"

# clean up
if [[ ! -n "$direct" ]]; then
	$UMOUNT "$dev"
fi

exit $RET
