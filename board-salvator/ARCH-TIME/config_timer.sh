#!/bin/sh
# timer device driver autotest shell-script

. $(dirname $0)/../config.sh

#tmp file
DRIVER="arch_timer"							# timer driver name of renesas
DRIVER_PATH="ARCH-TIME"						# path driver for run test	