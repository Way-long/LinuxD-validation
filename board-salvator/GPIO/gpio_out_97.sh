#!/bin/sh
if [ $1 ]
then    echo "--- start gpio97 test ---"
else    echo "usage: Argument(second) is needed."; exit
fi

if [ ! -e /sys/class/gpio/gpio900 ]
then
echo 900 > /sys/class/gpio/export
fi
echo out > /sys/class/gpio/gpio900/direction

start_time=`date +%s`
test_time=0
cnt=0

while [ "$test_time" -le "$1" ]
do
echo 1 > /sys/class/gpio/gpio900/value
echo 0 > /sys/class/gpio/gpio900/value

if [ "$cnt" -ge 10000 ]
then get_time=`date +%s`
test_time=`expr "$get_time" - "$start_time"`
cnt=0
else
cnt=$(($cnt + 1))
fi
done
