#!/bin/sh
# dma device driver autotest shell-script

set -e
#set -x

echo "\n************************DMAE CHECK DEVICE TEST**************************\n"

if ls /sys/bus/platform/drivers | grep $DMAC_SYS_DRIVER; then

	if ls /sys/bus/platform/drivers | grep $DMAC_USB_DRIVER; then
		eval $PASS_MEG
	else
	    eval $FAIL_MEG
	    exit 1
	fi 
else 
	eval $FAIL_MEG
fi		   	

echo "\n************************************************************************\n"
