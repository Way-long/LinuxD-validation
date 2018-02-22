#!/bin/sh
# thermal device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../../boards-conf/def_configs

#THERMAL_DEVICE_FOLDER="/sys/class/thermal"		# folder which contain device of thermal 

#THERMAL_DRIVER="rcar_gen3_thermal"			   	# name driver of thermal
#THERMAL_INTERRUPT1="e6198000.thermal"	  		# interrupt of thermal 1
#THERMAL_INTERRUPT2="e61a0000.thermal"	  		# interrupt of thermal 2
#THERMAL_INTERRUPT3="e61a8000.thermal"	  		# interrupt of thermal 3

#THERMAL_ZONE0="thermal_zone0"					# device of thermal 1
#THERMAL_ZONE1="thermal_zone1"					# device of thermal 2
#THERMAL_ZONE2="thermal_zone2"					# device of thermal 3

#TEMP_TRIP_NAME="trip_point_0_temp"				# name for get trip_point_0_temp
#TEMP_TRIP_VALUE="120000"						# value of trip_point_0_temp

#POINT_TRIP_NAME="trip_point_0_type"				# name for get trip_point_0_type
#POINT_TRIP_VALUE="critical"						# value of trip_point_0_type

#THERMAL2_IS_SUPPORT="false"						# thermal 2 support status

#THERMAL_CHECK_COMMAND="cat /dev/urandom > /dev/null"

#DRIVER_PATH="THERMAL"						    # path driver for run test	
#LOGFILE="thermal_log.txt"						# log file name      
