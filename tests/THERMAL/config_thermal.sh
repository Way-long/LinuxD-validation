#!/bin/sh
# thermal device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../../boards-conf/def_configs

DRIVER_PATH="THERMAL"				# path driver for run test
LOGFILE="thermal_log.txt"			# log file name
