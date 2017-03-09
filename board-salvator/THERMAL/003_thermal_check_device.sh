#!/bin/sh
# thermal device driver autotest shell-script

set -e
#set -x

echo "\n*********************THERMAL CHECK ALL DEVICE******************\n"

# check thermal zone 0
if ! ls $THERMAL_DEVICE_FOLDER | grep "$THERMAL_ZONE0"; then
	echo "$THERMAL_ZONE0 not found"
	eval $FAIL_MEG
fi

# check thermal zone 1
if ! ls $THERMAL_DEVICE_FOLDER | grep "$THERMAL_ZONE1"; then
	echo "$THERMAL_ZONE1 not found"
	eval $FAIL_MEG
fi

# check thermal zone 2
if ! ls $THERMAL_DEVICE_FOLDER | grep "$THERMAL_ZONE2"; then
	echo "$THERMAL_ZONE2 not found"
	eval $FAIL_MEG
fi

eval $PASS_MEG

echo "\n***************************************************************\n"