#!/bin/bash
# QSPI autotest shell-script

usage()
{
	echo "mtd_read.sh [-d] <read size(MB)>"
	exit
}

DEVICE="/dev/mtd2"

if [ "$1" = "-d" ] && [ -n "$2" ]; then
	if [ "$2" -gt 1 ] && [ "$2" -lt 32 ];
		then
		SIZE=${2}M
		echo "*** "${SIZE}" read ***"
		time -p dd if=$DEVICE of=/dev/null bs=$SIZE count=1
	else
		usage
	fi
elif [ -n "$1" ] && [ "$1" != "-d" ]
	then
	if [ "$1" -gt 1 ] && [ "$1" -lt 32 ];
		then
		SIZE=$(( $1 * 1024 * 1024))
		echo "*** "${SIZE}"byte read ***"
		time -p $(dirname $0)/flash_read -v $SIZE $DEVICE
	else
		usage
	fi
else
	usage
fi
