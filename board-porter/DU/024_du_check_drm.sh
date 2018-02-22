#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n*************************DRM DU CHECK TEST****************************\n"

# Connectors
cmd="modetest -M rcar-du -c"
echo $cmd

if ! eval $cmd;then
	echo "connector device error"
	eval $FAIL_MEG
	exit 1
fi

sleep 1

# Encoders
cmd="modetest -M rcar-du -e"
echo $cmd

if ! eval $cmd;then
	echo "connector device error"
	eval $FAIL_MEG
	exit 1
fi

sleep 1

# CRTCs
cmd="modetest -M rcar-du -p"
echo $cmd

if ! eval $cmd;then
	echo "connector device error"
	eval $FAIL_MEG
	exit 1
fi

eval $PASS_MEG

echo "\n**********************************************************************\n"