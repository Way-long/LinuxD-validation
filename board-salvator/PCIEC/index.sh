#!/bin/sh

set -a
#set -x

case "$1" in

1)
$(dirname $0)/exec_pciec.sh 001_pciec_check_dmesg.sh
sleep 3
;;

4)
$(dirname $0)/exec_pciec.sh 004_pciec_interface_down_up_test.sh
sleep 3
;;

7)
$(dirname $0)/exec_pciec.sh 007_pciec_check_dmesg_ethtools.sh
sleep 3
;;

8)
$(dirname $0)/exec_pciec.sh 008_pciec_interrupt_counter.sh
sleep 3
;;

9)
$(dirname $0)/exec_pciec.sh 009_pciec_ping_network_from_board.sh
sleep 3
;;

10)
$(dirname $0)/exec_pciec.sh 010_pciec_ping_network_from_pc.sh 1
sleep 3
;;

11)
$(dirname $0)/exec_pciec.sh 011_pciec_tranfers_data_from_board_to_host_pc.sh
sleep 3
;;

12)
$(dirname $0)/exec_pciec.sh 012_pciec_tranfers_data_from_host_pc_to_board.sh
sleep 3
;;

13)
$(dirname $0)/exec_pciec.sh 013_pciec_setting_s1000_full_on.sh
sleep 3
;;

14)
$(dirname $0)/exec_pciec.sh 014_pciec_setting_s100_full_on.sh
sleep 3
;;

15)
$(dirname $0)/exec_pciec.sh 015_pciec_setting_s10_full_on.sh
sleep 3
;;

16)
$(dirname $0)/exec_pciec.sh 016_pciec_setting_s1000_half_on.sh
sleep 3
;;

17)
$(dirname $0)/exec_pciec.sh 017_pciec_setting_s100_half_on.sh
sleep 3
;;

18)
$(dirname $0)/exec_pciec.sh 018_pciec_setting_s10_half_on.sh
sleep 3
;;

19)
$(dirname $0)/exec_pciec.sh 019_pciec_setting_s1000_full_off.sh
sleep 3
;;

20)
$(dirname $0)/exec_pciec.sh 020_pciec_setting_s100_full_off.sh
sleep 3
;;

21)
$(dirname $0)/exec_pciec.sh 021_pciec_setting_s10_full_off.sh
sleep 3
;;

22)
$(dirname $0)/exec_pciec.sh 022_pciec_setting_s1000_half_off.sh
sleep 3
;;

23)
$(dirname $0)/exec_pciec.sh 023_pciec_setting_s100_half_off.sh
sleep 3
;;

24)
$(dirname $0)/exec_pciec.sh 024_pciec_setting_s10_half_off.sh
sleep 3
;;

31)
$(dirname $0)/exec_pciec.sh 031_pciec_ctr+c_during_tranfers_data_from_board_to_host_pc.sh
sleep 3
;;

32)
$(dirname $0)/exec_pciec.sh 032_pciec_ctr+c_during_tranfers_data_from_host_pc_to_board.sh
sleep 3
;;

33)
$(dirname $0)/exec_pciec.sh 033_pciec_ctr+z_during_tranfers_data_from_board_to_host_pc.sh
sleep 3
;;

34)
$(dirname $0)/exec_pciec.sh 034_pciec_ctr+z_during_tranfers_data_from_host_pc_to_board.sh
sleep 3
;;

35)
$(dirname $0)/exec_pciec.sh 035_pciec_classA_check_ipadress.sh
sleep 3
;;

36)
$(dirname $0)/exec_pciec.sh 036_pciec_classB_check_ipadress.sh
sleep 3
;;

37)
$(dirname $0)/exec_pciec.sh 037_pciec_classC_check_ipadress.sh
sleep 3
;;

38) 
$(dirname $0)/exec_pciec.sh 038_pciec_classD_check_ipadress.sh
sleep 3
;;

39)
$(dirname $0)/exec_pciec.sh 039_pciec_classE_check_ipadress.sh
sleep 3
;;

esac