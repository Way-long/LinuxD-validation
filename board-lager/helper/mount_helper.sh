#!/bin/bash

# option
phelp(){
	echo "usage: $(basename $0) type [target]"
	echo "type: /mnt/sd0, /tmp/ram , /mnt/mtdblock0, ram, sd0, mtdblock0, mmcblk0p1, ..."
	echo "target: path to folder to mount"
}
i=1
while [[ "$i" -le "$#" ]]; do
	if [[ ${!i} == "-h" ]];then ((i++)); phelp;exit 0; fi
    # --------------------------
    ((i++))
done

# arguments process
if [[ "$#" > 1 ]]; then
	TYPE=${1,,} #lowercase
	TARGET=$2
else
	TARGET=$1
	TYPE=${TARGET##*/}
    TYPE=${TYPE,,} #lowercase
fi

# constant
MK_NEW_DIR="$(dirname $0)/../common/mk_new_folder.sh"
cmd="$(dirname $0)/../common/cmd.sh"
#create new directory to mount
$MK_NEW_DIR "$TARGET"
# mount
[[ -f $(dirname $0)/../lager ]] && source "$(dirname $0)/../lager"
[[ -f $(dirname $0)/../koelsch ]] && source "$(dirname $0)/../koelsch"
mount_dev=${!TYPE}

if [[ "$mount_dev" ]]; then
	$cmd "mount $mount_dev '$TARGET'"

elif ls "/dev/$TYPE" > /dev/null 2>&1 ; then
	$cmd "mount /dev/$TYPE '$TARGET'"
	
else
	echo "ERROR: unknow type $TYPE"
	exit 1;
fi

# check
if [ $? -ne 0 ];then
	echo -e "\nERROR: cannot mount $TYPE to $TARGET\n" >&2
	exit 1;
fi

exit 0;
