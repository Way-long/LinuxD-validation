#!/bin/sh

set -a
#set -x

case "$1" in

1)
$(dirname $0)/exec_usbfs.sh 001_check_dmesg.sh
sleep 3
;;

2)
$(dirname $0)/exec_usbfs.sh 002_check_interrupt.sh
sleep 3
;;

3)
$(dirname $0)/exec_usbfs.sh  003_usbfs_serial_setting.sh 1
sleep 3
;;

4)
$(dirname $0)/exec_usbfs.sh  004_usbfs_serial_board_to_pc.sh 1 
sleep 3
;;

5)
$(dirname $0)/exec_usbfs.sh  005_usbfs_serial_pc_to_board.sh 1
sleep 3
;;

7)
$(dirname $0)/exec_usbfs.sh 007_usbfs_serial_suspend_test.sh 1
sleep 3
;;

8)
$(dirname $0)/exec_usbfs.sh 008_usbfs_ethernet_setting_board.sh 1
sleep 3
;;

9)
$(dirname $0)/exec_usbfs.sh 009_usbfs_ethernet_setting_pc.sh 1
sleep 3
;;

10)
$(dirname $0)/exec_usbfs.sh 010_usbfs_ethernet_ping_board_pc.sh 1
sleep 3
;;

11)
$(dirname $0)/exec_usbfs.sh 011_usbfs_ethernet_ping_pc_board.sh 1
sleep 3
;;

12)
$(dirname $0)/exec_usbfs.sh 012_usbfs_ethernet_suspend.sh 1
sleep 3
;;

14)
$(dirname $0)/exec_usbfs.sh 014_usbfs_store_setting.sh 1
sleep 3
;;

15)
$(dirname $0)/exec_usbfs.sh 015_usbfs_store_copy_from_pc_to_sto_10M.sh 1
sleep 3
;;

16)
$(dirname $0)/exec_usbfs.sh 016_usbfs_store_copy_from_pc_to_sto_100M.sh 1
sleep 3
;;

17)
$(dirname $0)/exec_usbfs.sh 017_usbfs_store_copy_from_pc_to_sto_300M.sh 1
sleep 3
;;

18)
$(dirname $0)/exec_usbfs.sh 018_usbfs_store_copy_from_sto_to_pc_10M.sh 1
sleep 3
;;

19)
$(dirname $0)/exec_usbfs.sh 019_usbfs_store_copy_from_sto_to_pc_100M.sh 1
sleep 3
;;

20)
$(dirname $0)/exec_usbfs.sh 020_usbfs_store_copy_from_sto_to_pc_300M.sh 1
sleep 3
;;

21)
$(dirname $0)/exec_usbfs.sh 021_usbfs_store_speed_copy_sto_pc.sh 1
sleep 3
;;

22)
$(dirname $0)/exec_usbfs.sh 022_usbfs_store_copy_left_space.sh 1
sleep 3
;;

24)
$(dirname $0)/exec_usbfs.sh 024_usbfs_store_suspend.sh 1 
sleep 3
;;


25)
$(dirname $0)/exec_usbfs.sh 025_usbfs_sd_store_copy_from_pc_to_sd_100M.sh 1
sleep 3
;;

26)
$(dirname $0)/exec_usbfs.sh 026_usbfs_sd_store_copy_from_pc_to_sd_500M.sh 1
sleep 3
;;

27)
$(dirname $0)/exec_usbfs.sh 027_usbfs_sd_store_copy_from_pc_to_sd_1G.sh 1
sleep 3
;;

28)
$(dirname $0)/exec_usbfs.sh 028_usbfs_sd_store_copy_from_sd_to_pc_100M.sh 1
sleep 3
;;

29)
$(dirname $0)/exec_usbfs.sh 029_usbfs_sd_store_copy_from_sd_to_pc_500M.sh 1
sleep 3
;;

30)
$(dirname $0)/exec_usbfs.sh 030_usbfs_sd_store_copy_from_sd_to_pc_1G.sh 1
sleep 3
;;

31)
$(dirname $0)/exec_usbfs.sh 031_usbfs_sd_store_speed_copy_sd_pc.sh 1
sleep 3
;;

37)
$(dirname $0)/exec_usbfs.sh 037_usbfs_gzero_write_control.sh 1
sleep 3
;;

38)
$(dirname $0)/exec_usbfs.sh 038_usbfs_gzero_read_control.sh 1
sleep 3
;;

39)
$(dirname $0)/exec_usbfs.sh 039_usbfs_gzero_write_bulk.sh 1
sleep 3
;;

40)
$(dirname $0)/exec_usbfs.sh 040_usbfs_gzero_read_bulk.sh 1
sleep 3
;;

47)
$(dirname $0)/exec_usbfs.sh 047_smp_multiple_cpu_test.sh 1
sleep 3
;;

48)
$(dirname $0)/exec_usbfs.sh 048_stress_cpu.sh 1
sleep 3
;;

esac