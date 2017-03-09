#!/bin/bash
# thermal device driver autotest shell-script

set -e
#set -x

echo "\n*************THERMAL CHECK TEMP AND POINT DEVICE****************\n"

# thermal zone 0
echo "check thermal zone 0"
if ! cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE0}/${TEMP_TRIP_NAME} | grep "$TEMP_TRIP_VALUE" ; then
	echo "Temp of $THERMAL_ZONE0 is not true"
	eval $FAIL_MEG
	exit 1
fi

if ! cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE0}/${POINT_TRIP_NAME} | grep "$POINT_TRIP_VALUE" ; then
	echo "Type of $THERMAL_ZONE0 is not true"
	eval $FAIL_MEG
	exit 1
fi

# check thermal zone 1
echo "check thermal zone 1"
if ! cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE1}/${TEMP_TRIP_NAME} | grep "$TEMP_TRIP_VALUE" ; then
	echo "Temp of $THERMAL_ZONE1 is not true"
	eval $FAIL_MEG
	exit 1
fi

if ! cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE1}/${POINT_TRIP_NAME} | grep "$POINT_TRIP_VALUE" ; then
	echo "Type of $THERMAL_ZONE1 is not true"
	eval $FAIL_MEG
	exit 1
fi

# check thermal zone 2
if [ "$THERMAL2_IS_SUPPORT" = "true" ]; then
	echo "check thermal zone 2"
	if ! cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE2}/${TEMP_TRIP_NAME} | grep "$TEMP_TRIP_VALUE" ; then
		echo "Temp of $THERMAL_ZONE2 is not true"
		eval $FAIL_MEG
		exit 1
	fi

	if ! cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE2}/${POINT_TRIP_NAME} | grep "$POINT_TRIP_VALUE" ; then
		echo "Type of $THERMAL_ZONE02 is not true"
		eval $FAIL_MEG
		exit 1
	fi
fi

eval $PASS_MEG

echo "\n***************************************************************\n"