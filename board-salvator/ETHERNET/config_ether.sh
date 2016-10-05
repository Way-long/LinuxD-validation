#!/bin/sh
# ethernet device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../config.sh

# config driver ethernet shell script
DRIVER="ravb"								# ethernet driver name of renesas
ETH_INTERRUPT="e6800000.ethernet"			# interrupt of ethernet
INTERFACE="eth0"     						# interface of ethernet on board
DRIVER_PATH="ETHERNET"						# path driver for run test		
GOOGLE="google.co.jp"						# google site link
LOGFILE="ether_log.txt"						# log file name

# suport command
MOUNT_RAM="mount -t tmpfs -o size=400m tmpfs /tmp"
UNMOUNT_RAM="umount /tmp"

# # install tool on board for test 
# if ! pwd | grep "tftpboot" > /dev/null ;then

# 	echo "install tool on board for test"
# 	for tool in "ethtool" "taskset" "stress"; do

# 		if ! $tool --help > /dev/null 2>&1; then

# 			if [ "$tool" = "taskset" ];then
# 				$tool="util-linux"
# 			fi

# 			if apt-get install $tool > /dev/null 2>&1;then
# 				echo "installed $tool"
# 			else
# 				echo "install $tool error"	
# 			fi	
# 		fi

# 	done
# fi

# create file to copy data
if [ ! -d "$(dirname $0)/data" ]; then

  	mkdir -p $(dirname $0)/data

  	echo "Please wait during creating data for first time"
  	for SIZE_DATA in "1" "50" "350"; do
		#create file to copy data
		if [ ! -f "$(dirname $0)/data/file-${SIZE_DATA}mb" ]; then

		  	dd if=/dev/urandom of=$(dirname $0)/data/file-${SIZE_DATA}mb bs=1M count=${SIZE_DATA} > /dev/null

		fi
	done
fi

# check source code run from HOST PC
if ! uname -a | grep "linaro-nano" > /dev/null ;then
	
	#create folder on HOST PC
	  	for SIZE_DATA in "1" "50" "10" "15" "20" "25" "350"; do
			#create file to copy data
			if [ ! -f "${PC_FOLDER}/file-${SIZE_DATA}mb" ]; then
				echo "please wait during creating file $SIZE_DATA on HOST PC for fisrt time"
			  	dd if=/dev/urandom of=${PC_FOLDER}/file-${SIZE_DATA}mb bs=1M count=${SIZE_DATA} > /dev/null
			fi
			
		done

fi