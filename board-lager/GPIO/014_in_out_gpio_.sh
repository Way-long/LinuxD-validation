#!/bin/bash

echo "checking gpio led input/output"

driverLED6="e6054000"
driverLED7="e6054000"

$(dirname $0)/../common/wait_user_action.sh "Ensure that the following two gpio-ports are CONNECTED: TH7:886, TH6:887, then input \"next\" to continue..." "next"

base=`cat /sys/devices/*$driverLED6*/gpio/*/base`
((led6=$base+22))
base=`cat /sys/devices/*$driverLED7*/gpio/*/base`
((led7=$base+23))
# echo "$led6 $led7"
echo "$led6" > /sys/class/gpio/export
echo "$led7" > /sys/class/gpio/export
sleep 1
echo in > /sys/class/gpio/gpio$led6/direction
echo low > /sys/class/gpio/gpio$led7/direction

#write input value
for v in "0" "1";do
	echo $v > /sys/class/gpio/gpio$led7/value
	sleep 1
	vled7=`cat /sys/class/gpio/gpio$led6/value`
	[[ "$vled7" == "$v" ]] && echo "Write $v: PASSED" || echo "Write $v: FAILED"
done

echo "$led6" > /sys/class/gpio/unexport
echo "$led7" > /sys/class/gpio/unexport

