#!/bin/bash

# constant
MOUNT="$(dirname $0)/mount_helper.sh"
UMOUNT="$(dirname $0)/../common/remove_dev_dir.sh"
# arguments
for i in $(seq 0 9);do
	blkcnt[$i]=100
	block[$i]=1M
	do_times[$i]=5
done
# option
phelp(){
	echo "usage: $(basename $0) {-devX} [option]"
	echo "-dev[0-9]: dev x (x in 0-9) to write to (sd0, /mnt/sd1, /tmp/hd, ...)"
	echo "options:"
	echo "-bcnt[0-9]: block count for device x (x in 0-9).(Ex: 50, 100, ...).default 100"
	echo "-blk[0-9]: block for device x (x in 0-9).(Ex: 1M, 2M, ...).default 1M"
	echo "-direct[0-9]: dismiss mounting step for device x (x in 0-9)"
	echo "-times[0-9]: doing times for device x (x in 0-9).(Ex: 1, 50, 100, ...).default 5"
}
i=1
while [[ "$i" -le "$#" ]]; do
	if [[ "${!i}" == -blk[0-9] ]]; then
		arg=${!i##-blk}
		((i++))
		block[$arg]=${!i}
	fi
	if [[ "${!i}" == -times[0-9] ]]; then
		arg=${!i##-times}
		((i++))
		do_times[$arg] = ${!i}
	fi
	if [[ "${!i}" == -bcnt[0-9] ]]; then
		arg=${!i##-bcnt}
		((i++))
		blkcnt[$arg] = ${!i}
	fi
	if [[ "${!i}" == -dev[0-9] ]]; then
		arg=${!i##-dev}
		((i++))
		dev[$arg]=${!i}
	fi
	if [[ "${!i}" == -direct[0-9] ]]; then
		arg=${!i##-direct}
		direct[$arg] = true
	fi

	if [[ ${!i} == "-h" ]];then ((i++)); phelp;exit 0; fi
	# --------------------------
	((i++))
done
# -------------------------------------  TO DO  ------------------------------------
for i in $(seq 0 9);do
	if [[ -n "${dev[i]}" ]] && [[ ! -n "${direct[i]}" ]]; then
		$MOUNT "${dev[i]}"
	fi
done
$(dirname $0)/../common/create_random_file.sh "/tmp/cache" -bcnt $blkcnt -blk $block

for i in {0..9} ; do
	if [[ -n "${dev[i]}" ]]; then
		taskset -c 0 $(dirname $0)/write_helper.sh "${dev[i]}" -rw -times "${do_times[i]}" -direct -blk "${block[i]}" -bcnt "${blkcnt[i]}" -src "/tmp" &
		cpu[$i]=$!
	fi	
done

RET=0
echo "[$$]> wait all processes to finish"
for i in {0..9} ; do
	[[ "${cpu[i]}" ]] && { wait "${cpu[i]}" || { echo "ERROR: process ${cpu[i]} fail";RET=1; } }
done

[[ "$RET" == "0" ]] && echo "PASSED"


# clean up
for i in $(seq 0 9);do
	if [[ -n "${dev[i]}" ]] && [[ ! -n "${direct[i]}" ]]; then
		$UMOUNT "${dev[i]}"
	fi
done

exit $RET
