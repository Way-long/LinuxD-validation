#!/bin/sh

set -a
#set -x

. ./config_scif.sh

echo "================================================================================="
echo "|                              DEBUG SCIF DRIVER                                |"
echo "================================================================================="


case "$1" in

1)
echo "1)*****************************scif dmesg feature test***************************"
$(dirname $0)/dmesg.sh 
sleep 3
;;

2)
echo "2)******************************scif interrupts**********************************"
$(dirname $0)/proc-interrupts.sh
sleep 3
;;

3)
echo "3)******************************scif interrupts**********************************"
$(dirname $0)/serial_115200_8_1bit.sh
sleep 3
;;

8)
echo "8)******************************change scif test*********************************"
$(dirname $0)/serial_9600_8_1bit.sh
sleep 3
;;

9)
echo "9)******************************change scif test*********************************"
$(dirname $0)/serial_9600_8_2bit.sh
sleep 3
;;

15)
echo "15)******************************change scif test*********************************"
$(dirname $0)/serial_4800_8_1bit.sh
sleep 3
;;

16)
echo "16)******************************change scif test*********************************"
$(dirname $0)/serial_115200_7_1bit.sh
sleep 3
;;

17)
echo "17)*********************transfers file with baudrate 38400 ***********************"
$(dirname $0)/serial_transfers.sh 38400 pio
sleep 3
;;

18)
echo "18)*********************transfers file with baudrate 57600 ***********************"
$(dirname $0)/serial_transfers.sh 57600 pio
sleep 3
;;

19)
echo "19)*********************transfers file with baudrate 115200 **********************"
$(dirname $0)/serial_transfers.sh 115200 pio
sleep 3
;;

20)
echo "20)*********************transfers file with baudrate 230400 **********************"
$(dirname $0)/serial_transfers.sh 230400 pio
sleep 3
;;

21)
echo "21)*********************transfers file with baudrate 460800 **********************"
$(dirname $0)/serial_transfers.sh 460800 pio
sleep 3
;;

29)
echo "29)*****************************scif dmesg feature test***************************"
$(dirname $0)/dmesg.sh 
sleep 3
;;

30)
echo "30)******************************scif interrupts**********************************"
$(dirname $0)/proc-interrupts.sh
sleep 3
;;

31)
echo "31)******************************scif interrupts**********************************"
$(dirname $0)/serial_115200_8_1bit.sh
sleep 3
;;

32)
echo "32)******************************change scif test*********************************"
$(dirname $0)/serial_9600_8_1bit.sh
sleep 3
;;

33)
echo "33)******************************change scif test*********************************"
$(dirname $0)/serial_9600_8_2bit.sh
sleep 3
;;

34)
echo "34)******************************change scif test*********************************"
$(dirname $0)/serial_38400_8_1bit.sh
sleep 3
;;

35)
echo "35)******************************change scif test*********************************"
$(dirname $0)/serial_115200_7_1bit.sh
sleep 3
;;

36)
echo "36)*********************transfers file with baudrate 38400 ***********************"
$(dirname $0)/serial_transfers.sh 38400 dma
sleep 3
;;

37)
echo "37)*********************transfers file with baudrate 115200 **********************"
$(dirname $0)/serial_transfers.sh 115200 dma
sleep 3
;;

38)
echo "38)*********************transfers file with baudrate 460800 **********************"
$(dirname $0)/serial_transfers.sh 460800 dma
sleep 3
;;

42)
echo "42)******************************** smp scif test ********************************"
$(dirname $0)/smp-test-multi-cpu.sh
sleep 3
;;

43)
echo "43)******************************stress scif test ********************************"
$(dirname $0)/stress-cpu.sh
sleep 3
;;


esac