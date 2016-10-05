#!/bin/sh
# sata device driver autotest shell-script

. $(dirname $0)/../config.sh

# config driver sata shell script
DRIVER="sata_rcar"							# sata driver name of renesas
SATA_INTERRUPT="ee300000.sata"				# interrupt of sata
DRIVER_PATH="SATA"						    # path driver for run test		
LOGFILE="sata_log.txt"						# log file name

SATA_DEVICE="/dev/sda"						# sata device for connected