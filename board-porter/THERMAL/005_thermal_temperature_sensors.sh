#!/bin/bash
# thermal device driver autotest shell-script

set -e
#set -x

echo "\n*************THERMAL TEMPERATURE OF EACH SENSORS****************\n"

# Check temperature sensor 1
TEMPERATURE1=`cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE0}/temp`
echo "temperature of $THERMAL_ZONE0 : $TEMPERATURE1"
if [ "$TEMPERATURE1" -lt 0 ]; then 
	echo "temperature of $THERMAL_ZONE0 is zero or minus"
	eval $FAIL_MEG
	exit 1
fi

# Check temperature sensor 2
TEMPERATURE2=`cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE1}/temp`
echo "temperature of $THERMAL_ZONE1 : $TEMPERATURE2"
if [ "$TEMPERATURE2" -lt 0 ]; then
	echo "temperature of $THERMAL_ZONE1 is zero or minus"
	eval $FAIL_MEG
	exit 1
fi

if [ "$THERMAL2_IS_SUPPORT" = "true" ]; then

	# Check temperature sensor 2
	TEMPERATURE3=`cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE2}/temp`
	echo "temperature of $THERMAL_ZONE2 : $TEMPERATURE3"
	if [ "$TEMPERATURE3" -lt 0 ]; then
		echo "temperature of $THERMAL_ZONE2 is zero or minus"
		eval $FAIL_MEG
		exit 1
	fi

fi	

eval $PASS_MEG

echo "\n***************************************************************\n"