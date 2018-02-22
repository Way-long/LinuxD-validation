#!/bin/sh
# usb function device driver autotest shell-script

. $(dirname $0)/../config.sh

DRIVER="usbfs"								# ethernet driver name of renesas
USBFS_INTERRUPT="e6590000.usb"				# interrupt of ethernet
DRIVER_PATH="USB-FUNCTION"					# path driver for run test		
LOGFILE="usbfs.txt"						 	# log file name

#usb ethernet
USBFS_ETHER_INTERFACE="usb0"				# interface ethernet of usb function
IP_ADDRESS_PC="192.168.0.2"					# ip adress for setting PC
IP_ADDRESS_BOARD="192.168.0.1"				# ip adress for setting board
USBFS_BROAD_CAST="192.168.1.255"			# broadcast for seting ethernet

#usb storage
STORAGE_FOLDER="/media/${PCNAME}/storage"

echo $PCPASSWORD | sudo chown ${PCNAME}:${PCNAME} /dev/ttyACM0 > /dev/null 2>&1

# create folder on PC
if pwd | grep "tftpboot" > /dev/null ;then
	if ! [ -d $PC_FOLDER ];then
		echo "create PC FOLDER"
		mkdir -p $PC_FOLDER
	fi
fi	

# check source code run from HOST PC
if pwd | grep "tftpboot" > /dev/null ;then
	
	#create folder on HOST PC
	  	for SIZE_DATA in "10" "100" "300" "500" "1024"; do
			#create file to copy data
			if [ ! -f "${PC_FOLDER}/file-${SIZE_DATA}mb" ]; then
				echo "please wait during creating file $SIZE_DATA mb on HOST PC for fisrt time"
			  	dd if=/dev/urandom of=${PC_FOLDER}/file-${SIZE_DATA}mb bs=1M count=${SIZE_DATA} > /dev/null
				sync
			fi
			
		done

fi

