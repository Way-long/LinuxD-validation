#!/bin/sh
# sata device driver autotest shell-script

set -e
#set -x

echo "\n************************READ SMART SECTION SATA ERROR*******************\n"

cmd="smartctl -d ata -a /dev/sda"
echo "$cmd"

if eval $cmd > /dev/null; then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

echo "\n************************************************************************\n"