#!/bin/sh

echo "checking sysfs"

set -e
#set -x

OK=0
NG=0
FILE1="/tmp/sysfs"

echo "check infor of gpio sysfs"

cat /sys/class/gpio/gpiochip992/base > $FILE1

if cat $FILE1 | grep "992" > /dev/null; then
	echo "Check base passed"
        OK=$(($OK + 1))
else
	echo "Check base failed"
	NG=$(($NG + 1))
fi

cat /sys/class/gpio/gpiochip992/label > $FILE1

if cat $FILE1 | grep "e6050000.gpio" > /dev/null; then
	echo "Check label passed"
        OK=$(($OK + 1))
else
	echo "Check label failed"
	NG=$(($NG + 1))
fi

cat /sys/class/gpio/gpiochip992/ngpio > $FILE1

if cat $FILE1 | grep "32" > /dev/null; then
	echo "Check ngpio passed"
        OK=$(($OK + 1))
else
	echo "Check ngpio failed"
	NG=$(($NG + 1))
fi

echo "Passed:$OK Failed:$NG"

rm -r $FILE1
