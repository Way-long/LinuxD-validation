#!/bin/sh

set -a
#set -x

case "$1" in

1)
echo "1)"
$(dirname $0)/exec_i2c.sh 001_i2c_check_dmesg.sh
sleep 3
;;

2)
echo "2)"
$(dirname $0)/exec_i2c.sh 002_i2c_check_interrupt.sh
sleep 3
;;

3)
echo "3)"
$(dirname $0)/exec_i2c.sh 003_i2c_check_device.sh
sleep 3
;;

4)
echo "4)"
$(dirname $0)/exec_i2c.sh 004_i2c_check_device_node.sh
sleep 3
;;

5)
echo "5)"
$(dirname $0)/exec_i2c.sh 005_i2c_check_device_ak4643.sh
sleep 3
;;

6)
echo "6)"
$(dirname $0)/exec_i2c.sh 006_i2c_check_device_cs2000.sh
sleep 3
;;

12)
echo "12)"
$(dirname $0)/exec_i2c.sh 012_i2c_interrupt_counter.sh
sleep 3
;;

13)
echo "13)"
$(dirname $0)/exec_i2c.sh 013_i2c_unbind_bind.sh
sleep 3
;;

esac