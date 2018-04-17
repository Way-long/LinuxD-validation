#!/bin/sh
# gpio device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../../boards-conf/def_configs

DRIVER="gpio_rcar"
DRIVER_PATH="GPIO"
LOGFILE="gpio.txt"
