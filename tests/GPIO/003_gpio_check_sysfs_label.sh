#!/bin/sh
# gpio device driver autotest shell-script

set -e
#set -x

echo "\n************************CHECK GPIO SYSFS LABLE TEST*********************\n"

find /sys/class/gpio/gpiochip* > $LOGFILE

for gpiochip in $GPIOCHIP
do
	if ! cat $LOGFILE | grep $gpiochip;then
		echo "\n ${gpiochip} not found \n"
		eval $FAIL_MEG
		exit 1
	fi	
done

eval $PASS_MEG

rm -rf $LOGFILE

echo "\n************************************************************************\n"