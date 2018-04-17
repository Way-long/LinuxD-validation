#!/bin/sh

set -a
#set -x

. $(dirname $0)/config_scif.sh

echo "================================================================================="
echo "|                               TEST SCIF DRIVER                                |"
echo "================================================================================="
echo "1)*****************************scif dmesg feature test***************************"
$(dirname $0)/dmesg.sh 
sleep 3

echo "2)******************************scif interrupts**********************************"
$(dirname $0)/proc-interrupts.sh
sleep 3

echo "3,14)***************************change scif test**********************************"
$(dirname $0)/serial_115200_8_1bit.sh
sleep 3

echo "8)******************************change scif test**********************************"
$(dirname $0)/serial_9600_8_1bit.sh
sleep 3

echo "9)******************************change scif test**********************************"
$(dirname $0)/serial_9600_8_2bit.sh
sleep 3

echo "15)******************************change scif test*********************************"
$(dirname $0)/serial_4800_8_1bit.sh
sleep 3

echo "16)******************************change scif test*********************************"
$(dirname $0)/serial_115200_7_1bit.sh
sleep 3

echo "**************************remove all old log for test*****************************"
$(dirname $0)/remove_log.sh

echo "17)*********************transfers file with baudrate 38400 ***********************"
$(dirname $0)/serial_transfers.sh 38400 pio
sleep 3

echo "18)*********************transfers file with baudrate 57600 ***********************"
$(dirname $0)/serial_transfers.sh 57600 pio
sleep 3

echo "19)*********************transfers file with baudrate 115200 **********************"
$(dirname $0)/serial_transfers.sh 115200 pio
sleep 3

echo "20)*********************transfers file with baudrate 230400 **********************"
$(dirname $0)/serial_transfers.sh 230400 pio
sleep 3

echo "21)*********************transfers file with baudrate 460800 **********************"
$(dirname $0)/serial_transfers.sh 460800 pio
sleep 3
