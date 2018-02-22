#!/bin/sh
# sata device driver autotest shell-script

. $(dirname $0)/../../boards-conf/def_configs

# config driver sata shell script
#DRIVER="sata_rcar"							# sata driver name of renesas
#SATA_INTERRUPT="ee300000.sata"				# interrupt of sata
#DRIVER_PATH="SATA"						    # path driver for run test		
#LOGFILE="sata_log.txt"						# log file name

#SATA_DEVICE="/dev/sda"						# sata device for connected

############################################################
# get device dev

# only get dev if run on board
if uname -a | grep "linaro-nano" > /dev/null ;then

	#get device 
	DEVICE_PATH=`find /sys/devices/platform/soc/${SATA_INTERRUPT}/* -name "sd*" | sed -n 1p`

	DEVICE_SATA=`echo $DEVICE_PATH | tr '/' '\n' | tail -1`

	DEVICE_PATH=`find /sys/devices/platform/soc/${SATA_INTERRUPT}/* -name "sd*" | sed -n 2p`

	DEVICE_SATA_PART1=`echo $DEVICE_PATH | tr '/' '\n' | tail -1`
fi
