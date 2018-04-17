#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

INPUT="$1"

case $INPUT in

1)
echo "1)"
$(dirname $0)/exec_ethernet.sh 001_ether_check_dmesg.sh
sleep 3
;;

2)
echo "2)"
$(dirname $0)/exec_ethernet.sh 002_ether_check_interrupt.sh
sleep 3
;;

3)
echo "3)"
$(dirname $0)/exec_ethernet.sh 003_ether_ping_local_lan.sh
sleep 3
;;

4)
echo "4)"
$(dirname $0)/exec_ethernet.sh 004_ether_ping_network.sh
sleep 3                                                                                                                                                                                                                                                     eep 3
;;

5)
echo "5)"
$(dirname $0)/exec_ethernet.sh 005_ether_interrupt_counter.sh
sleep 3
;;

6)
echo "6)"
$(dirname $0)/exec_ethernet.sh 006_ether_unbind_bind_device.sh
sleep 3
;;

7)
echo "7)"
$(dirname $0)/exec_ethernet.sh 007_ether_dmesg_ethtools.sh
sleep 3
;;

8)
echo "8)"
$(dirname $0)/exec_ethernet.sh 008_ether_half_duplex_speed_test.sh
sleep 3
;;

9)
echo "9)"
$(dirname $0)/exec_ethernet.sh 009_ether_full_duplex_speed_test.sh
sleep 3
;;

10)
echo "10)"
$(dirname $0)/exec_ethernet.sh 010_ether_check_ethtool_msglv.sh
sleep 3
;;

11)
echo "11)"
$(dirname $0)/exec_ethernet.sh 011_ether_iperf_from_board_to_pc.sh 1
sleep 3
;;

12)
echo "12)"
$(dirname $0)/exec_ethernet.sh 012_ether_iperf_from_pc_to_board.sh 1
sleep 3
;;

13)
echo "13)"
$(dirname $0)/exec_ethernet.sh 013_ether_tranfers_data_from_board_to_host_pc.sh
sleep 3
;;

14)
echo "14)"
$(dirname $0)/exec_ethernet.sh 014_ether_tranfers_data_from_host_pc_to_board.sh
sleep 3
;;

15)
echo "15)"
$(dirname $0)/exec_ethernet.sh 015_ether_interface_down_up_test.sh
sleep 3
;;

16)
echo "16)"
$(dirname $0)/exec_ethernet.sh 016_ether_ping_after_suspend.sh 1
sleep 3
;;

17)
echo "17)"
$(dirname $0)/exec_ethernet.sh 017_ether_ping_during_suspend.sh 1
sleep 3
;;

19)
echo "19)"
$(dirname $0)/exec_ethernet.sh 019_ether_ctr+c_during_tranfers_data_from_host_pc_to_board.sh
sleep 3
;;

20)
echo "20)"
$(dirname $0)/exec_ethernet.sh 020_ether_ctr+z_during_tranfers_data_from_host_pc_to_board.sh
sleep 3
;;

21)
echo "21)"
$(dirname $0)/exec_ethernet.sh 021_ether_ctr+c_during_tranfers_data_from_board_to_host_pc.sh
sleep 3
;;

22)
echo "22)"
$(dirname $0)/exec_ethernet.sh 022_ether_ctr+z_during_tranfers_data_from_board_to_host_pc.sh
sleep 3
;;

23)
echo "23)"
$(dirname $0)/exec_ethernet.sh 023_ether_classA_check_ipadress.sh
sleep 3
;;

24)
echo "24)"
$(dirname $0)/exec_ethernet.sh 024_ether_classB_check_ipadress.sh
sleep 3
;;

25)
echo "25)"
$(dirname $0)/exec_ethernet.sh 025_ether_classC_check_ipadress.sh
sleep 3
;;

26)
echo "26)" 
$(dirname $0)/exec_ethernet.sh 026_ether_classD_check_ipadress.sh
sleep 3
;;

27)
echo "27)"
$(dirname $0)/exec_ethernet.sh 027_ether_classE_check_ipadress.sh
sleep 3
;;

28)
echo "28)"
$(dirname $0)/exec_ethernet.sh 028_ether_smp_mutilple_cpu.sh
sleep 3
;;

29)
echo "29)"
$(dirname $0)/exec_ethernet.sh 029_ether_stress_cpu.sh
sleep 3
;;

esac