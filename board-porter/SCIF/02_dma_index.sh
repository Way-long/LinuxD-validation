#!/bin/sh

set -a
#set -x

. ./config_scif.sh

echo "================================================================================="
echo "|                               TEST SCIF DRIVER                                |"
echo "================================================================================="
echo "29)*****************************scif dmesg feature test***************************"
$(dirname $0)/dmesg.sh 
sleep 3

echo "30)******************************scif interrupts**********************************"
$(dirname $0)/proc-interrupts.sh
sleep 3

echo "31)******************************scif interrupts**********************************"
$(dirname $0)/serial_115200_8_1bit.sh
sleep 3

echo "32)******************************change scif test*********************************"
$(dirname $0)/serial_9600_8_1bit.sh
sleep 3

echo "33)******************************change scif test*********************************"
$(dirname $0)/serial_9600_8_2bit.sh
sleep 3

echo "35)******************************change scif test*********************************"
$(dirname $0)/serial_115200_7_1bit.sh
sleep 3

echo "36)*********************transfers file with baudrate 38400 ***********************"
$(dirname $0)/serial_transfers.sh 38400 dma
sleep 3

echo "37)*********************transfers file with baudrate 115200 **********************"
$(dirname $0)/serial_transfers.sh 115200 dma
sleep 3

echo "38)*********************transfers file with baudrate 460800 **********************"
$(dirname $0)/serial_transfers.sh 460800 dma
sleep 3