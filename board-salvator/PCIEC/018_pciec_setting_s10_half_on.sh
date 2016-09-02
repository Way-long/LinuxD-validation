#!/bin/sh
# pciec device driver autotest shell-script

set -e
#set -x

echo "\n**********************ETHTOOLS SETING PARAMETER TEST********************\n"

if $(dirname $0)/ethtool_change_parameter.sh 10 half;then
	eval $PASS_MEG
else
	eval $FAIL_MEG
fi

echo "\n************************************************************************\n"
