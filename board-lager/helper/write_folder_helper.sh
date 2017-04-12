#!/bin/bash

# constant
MOUNT="$(dirname $0)/mount_helper.sh"
UMOUNT="$(dirname $0)/../common/remove_dev_dir.sh"
PREPARE_DATA="$(dirname $0)/../common/create_random_file.sh"
# arguments
dev=$1
folder_level=0
src="/mnt/ram"
blkcnt=50
block=1M
# option
phelp(){
	echo "usage: $(basename $0) dev_mount_folder [option]"
	echo "dev_mount_folder: /mnt/sd0, /tmp/hd, /mnt/ram ..."
	echo "options:"
	echo "-flvl: folder level (1, 2, 3, ...).default 1"
	echo "-bcnt: test data block count (10, 20, 100, ...).default 50"
	echo "-src: source folder (/mnt/ram, sd, ...).default /mnt/ram"
	echo "-blk: block (1M, 2M, ...).default 1M"
	echo "-read: read mode"
	echo "-direct: dismiss mounting step"
	echo "-hasdata: prepare data on device before writing"
}
i=1
while [[ "$i" -le "$#" ]]; do
	if [[ ${!i} == "-flvl" ]];then ((i++)); folder_level=${!i}; 
	fi
	if [[ ${!i} == "-read" ]];then mode_read=true; 
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
	if [[ ${!i} == "-h" ]];then ((i++)); phelp;exit 0; 
	fi
	((i++))
done

# --------------------------------------  TO DO  -----------------------------------
if [[ ! -n "$direct" ]]; then
	$MOUNT "$src"
	$MOUNT "$dev"
fi

if [[ -n "$hasData" ]]; then
	data=$(mktemp -p $dev/)
	$PREPARE_DATA $data -bcnt 50
fi

# write test
topFolder="lvl1"
folder="$topFolder"
for i in $(seq 2 $folder_level); do
	folder="${folder}/lvl${i}"
done

if [[ -n "$mode_read" ]]; then
	to="$src"
	from="$dev"
else
	from="$src"
	to="$dev"
fi
#
echo "[$$]> create directory [$from/$folder]"
mkdir -p "$from/$folder"
fromF=$(mktemp -p $from/$folder/)
toF="$to/$folder/$(basename $fromF)"
$PREPARE_DATA $fromF -bcnt $blkcnt -blk $block
echo "[$$]> copy folder"
cp -r "$from/$topFolder" "$to"
sync
# 
cmp "$fromF" "$toF" &&  echo -e "\nPASSED" || echo -e "\nFAILED"




# clean up
rm -r "$from/$topFolder"
rm -r "$to/$topFolder"
[[ -n "$hasData" ]] && rm "$data"


if [[ ! -n "$direct" ]]; then
	#umount and remove
	$UMOUNT "$src"
	$UMOUNT "$dev"
fi
