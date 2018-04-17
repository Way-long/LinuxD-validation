#!/bin/sh
# pciec device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../../boards-conf/def_configs

# config driver pciec shell script
DRIVER="rcar-pcie"							# pciec driver name of renesas
INTERFACE="enP2p1s0"     						# interface of pciec on board
DRIVER_PATH="PCIEC"							# path driver for run test		
GOOGLE="192.168.100.51"						# google site link
LOGFILE="pciec_log.txt"						# log file name

# seting ethernet for pciec
$(dirname $0)/setting_ethernet.sh > /dev/null
