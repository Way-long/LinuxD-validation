#!/bin/bash

# arguments
file=$1
blkcnt=350
block=1M

# option
phelp(){
	echo "usage: $(basename $0) path_to_file [option]"
	echo "options:"
	echo "-bcnt: block count"
	echo "-blk: block"
}
i=1
while [[ "$i" -le "$#" ]]; do
	if [[ ${!i} == "-bcnt" ]];then ((i++)); blkcnt=${!i}; 
	fi
	if [[ ${!i} == "-blk" ]];then ((i++)); block=${!i};
	fi
	if [[ ${!i} == "-h" ]];then ((i++)); phelp;exit 0; 
	fi
	((i++))
done
# =================== To Do ================================================
echo "[$$]> create random data $blkcnt*$block file [$file]"
f="$(dirname $0)/tmp/${blkcnt}_${block}"
if [[ ! -f "$f" ]]; then
	echo "Create cache $f"
	folder="$(dirname $0)/tmp"
	if ! ls "$folder" > /dev/null 2>&1; then
		echo "Make folder"
		mkdir -p "$folder"
		chmod 777 "$folder"
	fi
	log=`dd if=/dev/urandom of="$f" bs="$block" count="$blkcnt" 2>&1`
	[ $? -eq 0 ] && chmod 666 "$f" || echo -e "ERROR:\n$log"	
fi
log=`cp $f $file`
[ $? -eq 0 ] || echo -e "ERROR:\n$log"	

