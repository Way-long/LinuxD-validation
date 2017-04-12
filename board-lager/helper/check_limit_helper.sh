#!/bin/bash

# constant
MOUNT="$(dirname $0)/mount_helper.sh"
UMOUNT="$(dirname $0)/../common/remove_dev_dir.sh"
# arguments
dev=$1

# option
phelp(){
	echo "usage: $(basename $0) dev_mount_folder [option]"
	echo "dev_mount_folder: /mnt/sd0, /tmp/hd, /mnt/ram ..."
	echo "options:"
	echo "-direct: dismiss mounting step"
}
i=1
while [[ "$i" -le "$#" ]]; do
	if [[ ${!i} == "-direct" ]];then direct=true; 
	fi

	if [[ ${!i} == "-h" ]];then ((i++)); phelp;exit 0; 
	fi
	((i++))
done
# -------------------------------------  TO DO  ------------------------------------
if [[ ! -n "$direct" ]]; then
	$MOUNT "$dev"
fi

# do test
echo "[$$] writing data. be patient...."
log=`dd if=/dev/zero of="$dev/dmy_file" bs=1M count=200000 2>&1`
echo "$log"
echo "$log" | grep -i "no space left on device" > /dev/null && echo -e "\n[$$] PASSED" || echo -e "\n[$$] FAILED"
echo -e "\ncheck write other file"

log=`dd if=/dev/urandom of="$dev/nospace" bs=1M count=1 2>&1`
echo "$log" | grep -i "no space left on device" > /dev/null && echo -e "[$$] PASSED" || echo -e "[$$] FAILED"
if [[ -f "$dev/nospace" ]];then
	rm "$dev/nospace"
fi

# clean up
rm "$dev/dmy_file"

if [[ ! -n "$direct" ]]; then
	$UMOUNT "$dev"
fi