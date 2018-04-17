#!/bin/sh
# timer device driver autotest shell-script

set -a
#set -x

case "$1" in

1)
echo "1)"
$(dirname $0)/exec_timer.sh 001_timer_check_dmesg.sh 
sleep 3
;;

2)
echo "2)"
$(dirname $0)/exec_timer.sh 002_timer_check_interrupt.sh
sleep 3
;;

3)
echo "3)"
$(dirname $0)/exec_timer.sh 003_timer_interrupt_counter_5s.sh
sleep 3
;;

4)
echo "4)"
$(dirname $0)/exec_timer.sh 004_timer_interrupt_counter_300s.sh
sleep 3
;;

5)
echo "5)"
$(dirname $0)/exec_timer.sh 005_timer_setting_date_time_system.sh
sleep 3
;;

6)
echo "6)"
$(dirname $0)/exec_timer.sh 006_timer_suspend.sh 1
sleep 3
;;

esac