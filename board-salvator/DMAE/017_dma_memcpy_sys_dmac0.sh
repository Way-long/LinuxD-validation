#!/bin/sh
# dma device driver autotest shell-script

set -e
#set -x

echo "\n***********************MEMCOPY DATA TRANFERS TEST SYSDMAC0**************\n"

if ! modprobe dmatest;then
	echo "Please load module before test this item"
	eval $FAIL_MEG
	exit 1
fi	

if $(dirname $0)/mem_copy_dma.sh "$SYSDMAC0_INTERRUPT";then
	eval $PASS_MEG
else
	eval $FAIL_MEG	
fi

rmmod dmatest	

echo "\n************************************************************************\n"