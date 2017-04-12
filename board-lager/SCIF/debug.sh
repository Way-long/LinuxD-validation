#!/bin/sh

set -a
#set -x

. ./config_scif.sh


echo "================================================================================="
echo "|                              DEBUG SCIF DRIVER                                |"
echo "================================================================================="

case "$1" in

1) echo "1)*****************************scif dmesg feature test***************************"
$(dirname $0)/dmesg.sh 
sleep 3
;;

2) echo "2)******************************scif interrupts**********************************"
$(dirname $0)/proc-interrupts.sh
sleep 3
;;

esac