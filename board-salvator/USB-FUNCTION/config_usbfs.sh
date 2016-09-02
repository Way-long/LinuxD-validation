#!/bin/sh
# usb function device driver autotest shell-script

. $(dirname $0)/../config.sh

DRIVER="usbfs"								# ethernet driver name of renesas
INTERRUPT="e6590000.usb"					# interrupt of ethernet
DRIVER_PATH="USB-FUNCTION"					# path driver for run test		
LOGFILE="usbfs.txt"						 	# log file name

# check source code run from HOST PC
if pwd | grep "tftpboot" > /dev/null ;then
	
	#create folder on HOST PC
	  	for SIZE_DATA in "10" "100" "300" "500" "1024"; do
			#create file to copy data
			if [ ! -f "${PC_FOLDER}/file-${SIZE_DATA}mb" ]; then
				echo "please wait during creating file $SIZE_DATA on HOST PC for fisrt time"
			  	dd if=/dev/urandom of=${PC_FOLDER}/file-${SIZE_DATA}mb bs=1M count=${SIZE_DATA} > /dev/null
			fi
			
		done

fi