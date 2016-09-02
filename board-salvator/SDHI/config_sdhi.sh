#!/bin/sh
# sdhi device driver autotest shell-script

. $(dirname $0)/../config.sh

DRIVER="sh_mobile_sdhi"						# sdhi driver name of renesas

SDHI_INTERRUPT_0="ee100000.sd"				# interrupt of sdhi 1
SDHI_INTERRUPT_1="ee160000.sd"				# interrupt of sdhi 2

DRIVER_PATH="SDHI"							# path driver for run test
LOGFILE="storage.txt"						# log file name

# sdhi device for connected
DEVICE_SD1="/dev/mmcblk0"					
DEVICE_SD2="/dev/mmcblk1"