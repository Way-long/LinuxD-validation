#!/bin/bash
ONE_MB=1000000
ONE_BLK=512

# formater
ext3=mkfs.ext3
ext4=mkfs.ext4
fat=mkfs.fat
# 
cache="partitions_helper.cache"
dev=$1
partitions=1
((d_size=1500*$ONE_MB/$ONE_BLK))
phelp(){
	echo "usage: $(basename $0) dev [option]"
	cat <<END_OPTION
dev: /dev/sda, /dev/mmcblk0 ...
options:
-p: number of partitions.default 1
-p[1-4]: partition x (x in 1-4) size in MB (10, 200, 1000, ...).default 1500
-f[1-4]: partition x (x in 1-4) format (ext3, ext4, fat).default ext3
-l[1-4]: partition x (x in 1-4) label
END_OPTION
}

i=1
while [[ "$i" -le "$#" ]]; do
	if [[ ${!i} == "-h" ]];then ((i++)); phelp;exit 0; fi
	# number of parition
	if [[ "${!i}" == "-p" ]]; then
		((i++))
		if [[ "${!i}" -le 4 && "${!i}" -ge 1 ]]; then
			partitions=${!i}
		fi
	# partition size
	elif [[ "${!i}" == -p[1-4] ]]; then
		arg=${!i##-p}
		((i++))
		((p[$arg] = ${!i}*$ONE_MB/$ONE_BLK))
	# partition label
	elif [[ "${!i}" == -l[1-4] ]]; then
		arg=${!i##-l}
		((i++))
		l[$arg]=${!i}
	# partition format
	elif [[ "${!i}" == -f[1-4] ]]; then
		arg=${!i##-f}
		((i++))
		formater=${!i}
		f[$arg]=${!formater}
		d_f=${!formater}
		if ! hash "${!formater}" > /dev/null; then
			echo "ERROR: $formater is not supported"
			exit 1
		fi
	fi
	# increase index
	((i++))
done

if [[ ! "$d_f" ]]; then
	if hash "$ext3" > /dev/null; then
		d_f="$ext3"
	else
		echo "Error: ext3 format not supported"
		exit 1	
	fi
fi


getPartition(){
	# argument
	partition=$1
	# 
	if [[ "$dev"  == "/dev/sd"[a-d] ]]; then
        echo "${dev}${partition}"

	elif [[ "$dev" == "/dev/mmcblk"[0-9] ]]; then
        echo "${dev}p${partition}"

	else
        echo "unknown"
	fi
}


# todo
if [ ! -e "$dev" ]; then
   echo "ERROR: [$dev] does not exist"
   exit 1
fi

echo "[$$]> delete all partitions"
{
	echo d; echo 1
	echo d; echo 2
	echo d; echo 3
	echo d; echo 4
	echo w
} | fdisk "$dev" > $cache
 # 2>&1

echo "[$$]> create partitions"
{
	b_idx=2048
	for par in $(seq 1 $partitions); do
		echo n;echo p
		echo "$par"
		echo "$b_idx"
		size=${p[$par]}
		if [[ ! "$size" ]]; then
			size="$d_size"
		fi
		echo "+$size"
		# echo t
		# if [[ $par -gt 1 ]]; then
		# 	echo "$par"
		# fi
		# echo 83
		((b_idx=$b_idx + $size + 1))
	done
	echo w
} | fdisk "$dev" > $cache
 # 2>&1

# check exist
for par in $(seq 1 $partitions); do
	partition=`getPartition "$par"`
	if [ ! -e "$partition" ]; then
   		echo "ERROR: [$partition] does not created"
   		echo -e "\nLogs:"
   		cat $cache
   		exit 1
	fi	
done

echo "[$$]> format all created partitions"
for par in $(seq 1 $partitions); do
	partition=`getPartition "$par"`
	formater=${f[$par]}
	label=${l[$par]}
	if [[ ! "$format" ]]; then
		formater="$d_f"
	fi
	if [[ "$label" ]]; then
		[[ "$formater" == "mkfs.fat" ]] && label="-n $label"
		[[ "$formater" == "mkfs.ext3" ]] && label="-L $label"
		[[ "$formater" == "mkfs.ext4" ]] && label="-L $label"
	fi
	# 
	echo "$formater $partition $label"
	"$formater" "$partition" $label > /dev/null
		 # 2>&1
	
done

# clean up
rm $cache > /dev/null