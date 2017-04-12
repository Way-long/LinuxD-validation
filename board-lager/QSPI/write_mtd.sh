#!/bin/bash
# QSPI autotest shell-script

set -e
#set -x

usage()
{
echo "mtd_write.sh [-d] <read size(MB)>"
exit
}

DEVICE="/dev/mtd2"

if [ "$1" = "-d" ] && [ -n "$2" ]; then
if [ $2 -gt 1 ] && [ $2 -lt 32 ];
then
SIZE=${2}M
PAGE=$(( $2 * 4 ))
echo "*** "${PAGE}"page erase ***"
time -p flash_erase $DEVICE 0 $PAGE
echo "*** "${SIZE}" write ***"
time -p dd if=/dev/urandom of=$DEVICE bs=$SIZE count=1
else
usage
fi
elif [ -n "$1" ] && [ "$1" != "-d" ]
then
if [ $1 -gt 1 ] && [ $1 -lt 32 ];
then
SIZE=$(( $1 * 1024 * 1024))
PAGE=$(( $1 * 4 ))
echo "*** "${PAGE}"page erase ***"
time -p flash_erase $DEVICE 0 $PAGE
echo "*** "${SIZE}"byte write ***"
time -p $(dirname $0)/flash_write -v $SIZE $DEVICE
else
usage
fi
else
usage
fi
