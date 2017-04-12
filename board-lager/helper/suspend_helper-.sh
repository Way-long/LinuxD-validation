#!/bin/bash
source "$(dirname $0)/../config.sh"

# constant
on_board_path=`$(dirname $0)/../common/path_helper.sh`
MOUNT_DEVICE="$on_board_path/../helper/mount_helper.sh"
UMOUNT_DEVICE="$on_board_path/../common/remove_dev_dir.sh"
MODE_SAW="saw"
MODE_SAR="sar"
MODE_SWW="sww"
MODE_SWR="swr"
# arguments
dev=$1
blkcnt=50
mode="$MODE_SAW"
# option
phelp(){
	echo "USAGE: $(basename $0) dev_mount_folder [option]"
	echo "dev_mount_folder: /mnt/sd0, /tmp/hd, /mnt/ram ..."
	echo "options:"
	echo "-bcnt: block count (50, 100, ...).default 50"
	cat <<END_OPTION
-a: action (saw, sar, sww, swr)
	saw: susspend after writing (default)
	sar: susspend after reading
	sww: susspend while writing
	swr: susspend while reading
END_OPTION
}
i=1
while [[ "$i" -le "$#" ]]; do
	if [[ ${!i} == "-a" ]];then ((i++)); mode=${!i};
	fi
	if [[ ${!i} == "-bcnt" ]];then ((i++)); blkcnt=${!i}; 
	fi
	
	if [[ ${!i} == "-h" ]];then phelp;exit 0; 
	fi
	((i++))
done
# -------------------------------------  TO DO  ------------------------------------
ssh $SSH_AUTHEN "$MOUNT_DEVICE '$dev'"

if [[ "$mode" == "$MODE_SAW" ]]; then
	echo "write data to [$dev] then susspend"
	ssh $SSH_AUTHEN "dd if=/dev/urandom of='$dev/file' bs=1M count=$blkcnt ;sync"
elif [[ "$mode" == "$MODE_SAR" ]]; then
	echo "prepare data on [$dev]"
	ssh $SSH_AUTHEN "dd if=/dev/urandom of='$dev/file' bs=1M count=$blkcnt > /dev/null 2>&1;sync"
	echo "read data from [$dev]"
	ssh $SSH_AUTHEN "cp '$dev/file' /tmp ;sync"
elif [[ "$mode" == "$MODE_SWW" ]]; then
	echo "while writing data to [$dev], susspend the system"
	{
		if ssh $SSH_AUTHEN "dd if=/dev/urandom of='$dev/file' bs=128 count=160000" ; then
			echo "copy finished"
		else
			echo "copy finished with error code"
		fi
	} &
	pid=$!
elif [[ "$mode" == "$MODE_SWR" ]]; then
	echo "prepare data on [$dev]"
	ssh $SSH_AUTHEN "dd if=/dev/urandom of='$dev/file' bs=1M count=$blkcnt > /dev/null 2>&1;sync"

	echo "while reading data from [$dev], susspend the system"
	{
		if ssh $SSH_AUTHEN "dd if='$dev/file' of='/tmp/file' bs=6" ; then
			echo "copy finished"
		else
			echo "copy finished with error code"
		fi
	} &
	pid=$!
else
	echo "ERROR: unknown action!!!!"
fi
#
sleep 3
$(dirname $0)/../common/suspend_resume.sh
# 
if [[ -n "$pid" ]] && ps -p $pid > /dev/null;then
	echo "wait $pid"
	wait $pid
fi
# 
ssh $SSH_AUTHEN "rm '$dev/file'"
# umount device
ssh $SSH_AUTHEN "$UMOUNT_DEVICE '$dev'"
sleep 2
# check write again
ssh $SSH_AUTHEN "$on_board_path/../helper/write_helper.sh '$dev' -rw -bcnt $blkcnt"


