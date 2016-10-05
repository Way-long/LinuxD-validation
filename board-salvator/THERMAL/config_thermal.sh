#!/bin/sh
# thermal device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../config.sh

DRIVER="rcar_thermal"			   				# name driver of thermal
THERMAL_INTERRUPT="e6198000.thermal"	  		# interrupt of thermal

DRIVER_PATH="THERMAL"						    # path driver for run test	
LOGFILE="thermal_log.txt"						# log file name      