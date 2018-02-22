#!/bin/sh

set -a
#set -x

case "$1" in

1)
echo "1)"
$(dirname $0)/exec_gpio.sh 001_gpio_check_dmesg.sh 
sleep 3
;;

2)
echo "2)"
$(dirname $0)/exec_gpio.sh 002_gpio_check_interrupt.sh
sleep 3
;;

3)
echo "3)"
$(dirname $0)/exec_gpio.sh 003_gpio_check_sysfs_label.sh
sleep 3
;;

4)
echo "4)"
$(dirname $0)/exec_gpio.sh 004_gpio_check_sysfs_base.sh
sleep 3
;;

5)
echo "5)"
$(dirname $0)/exec_gpio.sh 005_gpio_check_sysfs_ngpio.sh
sleep 3
;;

8)
echo "8)"
$(dirname $0)/exec_gpio.sh 008_gpio_check_gpiochip.sh
sleep 3
;;

9) 
echo "9)"
$(dirname $0)/exec_gpio.sh 009_gpio_check_input_output.sh
sleep 3
;;

10)
echo "10)"
$(dirname $0)/exec_gpio.sh 010_gpio_check_interrupt_counter.sh
sleep 3
;;

14)
echo "14)"
$(dirname $0)/exec_gpio.sh 014_gpio_check_left_boundary_minus_one.sh
sleep 3
;;

15)
echo "15)"
$(dirname $0)/exec_gpio.sh 015_gpio_check_left_boundary.sh
sleep 3
;;

16)
echo "16)"
$(dirname $0)/exec_gpio.sh 016_gpio_check_left_boundary_add_one.sh
sleep 3
;;

17)
echo "17)"
$(dirname $0)/exec_gpio.sh 017_gpio_check_right_boundary_minus_one.sh
sleep 3
;;

18)
echo "18)"
$(dirname $0)/exec_gpio.sh 018_gpio_check_right_boundary.sh
sleep 3
;;

19)
echo "19)"
$(dirname $0)/exec_gpio.sh 019_gpio_check_right_boundary_add_one.sh
sleep 3
;;

esac