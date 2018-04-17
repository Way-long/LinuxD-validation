#!/bin/sh
# display unit device driver autotest shell-script

# config file shell script
. $(dirname $0)/../../boards-conf/def_configs

#dma interrupt
DRIVER="rcar-du"				# display unit driver name of renesas
DRIVER_PATH="DU"				# path driver for run test
LOGFILE="du.txt"
