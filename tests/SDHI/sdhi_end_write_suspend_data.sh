#!/bin/sh
# sdhi device driver autotest shell-script

. $(dirname $0)/config_sdhi.sh

set -a
#set -x

sync

if cmp ${SD1_DIR}/file-350mb ${RAM_DIR}/file-350mb;then
	eval $PASS_MEG
else
	eval $FAIL_MEG	
fi

rm -rf $RAM_DIR/*

rm -rf $SD1_DIR/*

umount $RAM_DIR

umount $SD1_DIR