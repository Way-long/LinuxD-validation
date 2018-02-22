#!/bin/sh
# thermal device driver autotest shell-script

set -a
#set -x

case "$1" in

1)
$(dirname $0)/exec_thermal.sh 001_thermal_check_dmesg.sh
sleep 3
;;

2)
$(dirname $0)/exec_thermal.sh 002_thermal_check_interrupt.sh
sleep 3
;;

3)
$(dirname $0)/exec_thermal.sh 003_thermal_check_device.sh
sleep 3
;;

4)
$(dirname $0)/exec_thermal.sh 004_thermal_check_type_and_point.sh
sleep 3
;;

5) 
$(dirname $0)/exec_thermal.sh 005_thermal_temperature_sensors.sh
sleep 3
;;

6) 
$(dirname $0)/exec_thermal.sh 006_thermal_temperature_counter_increase.sh
sleep 3
;;

7)
$(dirname $0)/exec_thermal.sh 007_thermal_temperature_counter_decrease.sh
sleep 3
;;

8)
$(dirname $0)/exec_thermal.sh 008_thermal_temperature_counter_interrupt.sh
sleep 3
;;

9)
$(dirname $0)/exec_thermal.sh 009_thermal_suspend.sh 1
sleep 3
;;

10)
$(dirname $0)/exec_thermal.sh 010_unbind_bind_thermal_device.sh
sleep 3
;;

esac