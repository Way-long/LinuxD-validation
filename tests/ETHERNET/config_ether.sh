#!/bin/sh
# ethernet device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../../boards-conf/def_configs

# config driver ethernet shell script
DRIVER="sh-eth"								# ethernet driver name of renesas
DRIVER_PATH="ETHERNET"						# path driver for run test
LOGFILE="ether_log.txt"						# log file name
