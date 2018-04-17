#!/bin/sh
# sata device driver autotest shell-script

. $(dirname $0)/../../boards-conf/def_configs

# config driver sata shell script
DRIVER="sata_rcar"							# sata driver name of renesas
DRIVER_PATH="SATA"						    # path driver for run test		
LOGFILE="sata_log.txt"						# log file name

############################################################
# get device dev
# only get dev if run on board
if ifconfig | grep -i $IPBOARD > /dev/null; then
	#get device 
	DEVICE_PATH=`find /sys/devices/platform/${SATA_INTERRUPT}/* -name "sd*" | sed -n 1p`
	DEVICE_SATA=`echo $DEVICE_PATH | tr '/' '\n' | tail -1`
	DEVICE_PATH=`find /sys/devices/platform/${SATA_INTERRUPT}/* -name "sd*" | sed -n 2p`
	DEVICE_SATA_PART1=`echo $DEVICE_PATH | tr '/' '\n' | tail -1`
	echo "Device will be used: $DEVICE_SATA $DEVICE_SATA_PART1"
fi
