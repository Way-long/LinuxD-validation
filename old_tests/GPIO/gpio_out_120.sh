#!/bin/sh
if [ $1 ]
then    echo "--- start gpio120 test ---"
else    echo "usage: Argument(second) is needed."; exit
fi

if [ ! -e /sys/class/gpio/gpio920 ]
then
echo 920 > /sys/class/gpio/export
fi
echo out > /sys/class/gpio/gpio920/direction

start_time=`date +%s`
test_time=0
cnt=0

while [ "$test_time" -le "$1" ]
do
echo 1 > /sys/class/gpio/gpio920/value
echo 0 > /sys/class/gpio/gpio920/value

echo "$cnt"

if [ "$cnt" -ge 10000 ]
then get_time=`date +%s`
test_time=`expr "$get_time" - "$start_time"`
cnt=0
else
cnt=$(($cnt + 1))
fi
done
