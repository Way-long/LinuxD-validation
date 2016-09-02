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
$(dirname $0)/exec_thermal.sh 003_thermal_temperature_chip.sh
sleep 3
;;

7)
$(dirname $0)/exec_thermal.sh 007_thermal_suspend.sh
sleep 3
;;

8)
$(dirname $0)/exec_thermal.sh 008_unbind_bind_thermal_device.sh
sleep 3
;;

esac