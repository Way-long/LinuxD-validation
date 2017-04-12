#!/bin/bash

echo "checking gpio led interrupt counting"

driverLED6="e6054000"
driverLED7="e6054000"
int_grep="gpiolib"
cache="/tmp/gpio.tmp"

# ========================================== TO DO =============================================
$(dirname $0)/../common/wait_user_action.sh "Ensure that the following two gpio-ports are CONNECTED: TH7:886, TH6:887, then input \"next\" to continue..." "next"

# export
base=`cat /sys/devices/*$driverLED6*/gpio/*/base`
((led6=$base+22))
base=`cat /sys/devices/*$driverLED7*/gpio/*/base`
((led7=$base+23))
# echo "$led6 $led7"
echo "$led6" > /sys/class/gpio/export
echo "$led7" > /sys/class/gpio/export
#init
echo low > /sys/class/gpio/gpio$led7/direction

#count up
echo -e "\nCheck rising"
echo 0 > /sys/class/gpio/gpio$led7/value
sleep 1
echo rising > /sys/class/gpio/gpio$led6/edge
cat /proc/interrupts | grep "$int_grep" > $cache
echo 1 > /sys/class/gpio/gpio$led7/value
sleep 1
cat $cache | $(dirname $0)/../common/check_interrupt_count.sh 1

# count down
echo -e "\nCheck falling"
echo falling > /sys/class/gpio/gpio$led6/edge
cat /proc/interrupts | grep "$int_grep" > $cache
echo 0 > /sys/class/gpio/gpio$led7/value
sleep 1
cat $cache | $(dirname $0)/../common/check_interrupt_count.sh 1

# count both
echo -e "\nCheck both"

echo both > /sys/class/gpio/gpio$led6/edge
cat /proc/interrupts | grep "$int_grep" > $cache
echo 1 > /sys/class/gpio/gpio$led7/value
sleep 1
echo 0 > /sys/class/gpio/gpio$led7/value
sleep 1
cat $cache | $(dirname $0)/../common/check_interrupt_count.sh 2

# unexport 
echo "$led6" > /sys/class/gpio/unexport
echo "$led7" > /sys/class/gpio/unexport