#!/bin/sh

set -a
#set -x

. ./config_qspi.sh

echo "================================================================================="
echo "|                              DEBUG QSPI DRIVER                                |"
echo "================================================================================="

case "$1" in

1)	
echo "1)**************************QSPI dmesg feature test******************************"
$(dirname $0)/dmesg.sh 
sleep 3
;;

2)
echo "2)******************************QSPI interrupts**********************************"
$(dirname $0)/proc-interrupts.sh
sleep 3
;;


3)
echo "3)***************************create-ext3-system-QSPI*****************************"
$(dirname $0)/create-ext3-system-QSPI.sh
sleep 3
;;


4)
echo "4)******************************write-QSPI-to-RAM********************************"
$(dirname $0)/write-QSPI-to-RAM.sh
sleep 3
;;

5)
echo "5)******************************write-RAM-to-QSPI********************************"
$(dirname $0)/write-RAM-to-QSPI.sh
sleep 3
;;

6)
echo "6)**************************write-file70mb-RAM-to-QSPI***************************"
$(dirname $0)/write-file70mb-RAM-to-QSPI.sh
sleep 3
;;

7)
echo "7)******************************suspend inside **********************************"
$(dirname $0)/suspend_inside.sh
sleep 3
;;

8)
echo "8)******************************suspend while copy*******************************"
$(dirname $0)/suspend_while_copy.sh
sleep 3
;;

9)
echo "9)******************************unbind-bind-write-QSPI***************************"
$(dirname $0)/unbind-bind-write.sh
sleep 3
;;

10)
echo "10)*****************************qspi-partition0-read*****************************"
$(dirname $0)/qspi-partition0-read.sh
sleep 3
;;

11)
echo "11)*****************************qspi-partition1-read*****************************"
$(dirname $0)/qspi-partition1-read.sh
sleep 3;;


12)
echo "12)*****************************qspi-partition2-read*****************************"
$(dirname $0)/qspi-partition2-read.sh
sleep 3
;;

13)
echo "13-14-15)***********************character-data-write*****************************"
$(dirname $0)/character-data-write.sh
sleep 3
;;

16)
echo "16)*******************************block-data-write*******************************"
$(dirname $0)/block-data-write.sh
sleep 3
;;


17)
echo "17)**************************ctr_c-write-read-RAM-to-QSPI************************"
$(dirname $0)/ctr_c-write-read-RAM-to-QSPI.sh
sleep 3
;;

18)
echo "18)**************************ctr_z-write-read-RAM-to-QSPI************************"
$(dirname $0)/ctr_z-write-read-RAM-to-QSPI.sh
sleep 3
;;

19)
echo "19)******************************QUAD-test-speed-QSPI****************************"
echo "root@linaro-nano:~#./read_mtd.sh -d 20"
$(dirname $0)/read_mtd.sh -d 20
sleep 3
echo "root@linaro-nano:~#./read_mtd.sh 20"
$(dirname $0)/read_mtd.sh 20
sleep 3
echo "root@linaro-nano:~#./write_mtd.sh -d 20"
$(dirname $0)/write_mtd.sh -d 20
sleep 3
echo "root@linaro-nano:~#./write_mtd.sh 20"
$(dirname $0)/write_mtd.sh 20
sleep 3
;;

22)
echo "22*********************************smp multiple cpu******************************"
$(dirname $0)/smp-test-multi-cpu.sh
sleep 3
;;

23)
echo "23******************************qspi-weight-read-write***************************"
$(dirname $0)/qspi-weight-read-write.sh 2
sleep 3
;;

esac










