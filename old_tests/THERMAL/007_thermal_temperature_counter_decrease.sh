#!/bin/sh
# thermal device driver autotest shell-script

set -a
#set -x

echo "\n*************THERMAL TEMPERATURE DECREASE TEST****************\n"

$(dirname $0)/../common/kill_process.sh "cat /dev/urandom" > /dev/null 2>&1

for i in $(seq 1 100);
do

	eval $THERMAL_CHECK_COMMAND &

done

BEGIN0=`cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE0}/temp`
echo "Begin temperature of $THERMAL_ZONE0 : $BEGIN0"
if [ "$BEGIN0" -lt 0 ]; then 
	echo "temperature of $THERMAL_ZONE0 is zero or minus"
	eval $FAIL_MEG
	exit 1
fi

BEGIN1=`cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE1}/temp`
echo "Begin temperature of $THERMAL_ZONE1 : $BEGIN1"
if [ "$BEGIN1" -lt 0 ]; then
	echo "temperature of $THERMAL_ZONE1 is zero or minus"
	eval $FAIL_MEG
	exit 1
fi

if [ "$THERMAL2_IS_SUPPORT" = "true" ]; then

	# Check temperature sensor 2
	BEGIN2=`cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE2}/temp`
	echo "Begin temperature of $THERMAL_ZONE2 : $BEGIN2"
	if [ "$BEGIN2" -lt 0 ]; then
		echo "temperature of $THERMAL_ZONE2 is zero or minus"
		eval $FAIL_MEG
		exit 1
	fi

fi

$(dirname $0)/../common/kill_process.sh "cat /dev/urandom" > /dev/null 2>&1

sleep 5

END0=`cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE0}/temp`
echo "END temperature of $THERMAL_ZONE0 : $END0"
if [ "$END0" -lt 0 ]; then 
	echo "temperature of $THERMAL_ZONE0 is zero or minus"
	eval $FAIL_MEG
	exit 1
fi

END1=`cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE1}/temp`
echo "END temperature of $THERMAL_ZONE1 : $END1"
if [ "$END1" -lt 0 ]; then
	echo "temperature of $THERMAL_ZONE1 is zero or minus"
	eval $FAIL_MEG
	exit 1
fi

if [ "$THERMAL2_IS_SUPPORT" = "true" ]; then

	# Check temperature sensor 2
	END2=`cat ${THERMAL_DEVICE_FOLDER}/${THERMAL_ZONE2}/temp`
	echo "END temperature of $THERMAL_ZONE2 : $END2"
	if [ "$END2" -lt 0 ]; then
		echo "temperature of $THERMAL_ZONE2 is zero or minus"
		eval $FAIL_MEG
		exit 1
	fi

fi

if [ "$BEGIN0" -le "$END0" ]; then
	echo "temperature of sensor 0 is not change"
	eval $FAIL_MEG
	exit 1
fi

if [ "$BEGIN1" -le "$END1" ]; then
	echo "temperature of sensor 1 is not change"
	eval $FAIL_MEG
	exit 1
fi

if [ "$THERMAL2_IS_SUPPORT" = "true" ]; then

	if [ "$BEGIN2" -le "$END2" ]; then
		echo "temperature of sensor 2 is not change"
		eval $FAIL_MEG
		exit 1
	fi

fi

eval $PASS_MEG


echo "\n***************************************************************\n"