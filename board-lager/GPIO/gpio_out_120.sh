#!/bin/sh
set -e

pin=920

if [ ! -e /sys/class/gpio/gpio${pin} ]
	then
	echo ${pin} > /sys/class/gpio/export
fi
echo out > /sys/class/gpio/gpio${pin}/direction

echo "[$$] start gpio120 test"
start_time=`date +%s`
print_time=0
test_time=0
cnt=0

while [ "$test_time" -le "$1" ]
do
	echo 1 > /sys/class/gpio/gpio${pin}/value
	echo 0 > /sys/class/gpio/gpio${pin}/value
	# -----------------------------------------------------------
	if [ "$cnt" -ge 10000 ]
		then get_time=`date +%s`
		test_time=`expr "$get_time" - "$start_time"`
		if [ "$test_time" -gt "$print_time" ]; then
			echo "[$$] passed time: $test_time"
			print_time=`expr "$test_time" + "120"`
		fi
		cnt=0
	else
		cnt=$(($cnt + 1))
	fi
done
echo "[$$] gpio120 test finished"