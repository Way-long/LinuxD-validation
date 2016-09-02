#!/bin/sh
# sata device driver autotest shell-script

set -a
#set -x

case "$1" in

1)
$(dirname $0)/exec_sata.sh 001_sata_check_dmesg.sh
sleep 3
;;

2)
$(dirname $0)/exec_sata.sh 002_sata_check_interrupt.sh
sleep 3
;;

3)
$(dirname $0)/exec_sata.sh 003_sata_check_hard_disk_speed.sh 
sleep 3
;;

4)
$(dirname $0)/exec_sata.sh 004_sata_check_hard_disk_cache.sh 
sleep 3
;;

5)
$(dirname $0)/exec_sata.sh 005_sata_enable_commands_section.sh   
sleep 3
;;

6)
$(dirname $0)/exec_sata.sh 006_sata_read_smart_data_section.sh
sleep 3
;;

7)
$(dirname $0)/exec_sata.sh 007_sata_read_smart_data_section_error.sh
sleep 3
;;

8)
$(dirname $0)/exec_sata.sh 008_sata_create_partion_ext3_system.sh
sleep 3
;;

9)
$(dirname $0)/exec_sata.sh 009_sata_create_partion_smp_test.sh
sleep 3
;;

10)
$(dirname $0)/exec_sata.sh 010_sata_write_ram_to_sata_10MB.sh
sleep 3
;;

11)
$(dirname $0)/exec_sata.sh 011_sata_write_ram_to_sata_100MB.sh
sleep 3
;;

12)
$(dirname $0)/exec_sata.sh 012_sata_write_ram_to_sata_350MB.sh
sleep 3
;;

13)
$(dirname $0)/exec_sata.sh 013_sata_write_ram_to_sata_one_folder.sh
sleep 3
;;

14)
$(dirname $0)/exec_sata.sh 014_sata_write_ram_to_sata_five_folder.sh
sleep 3
;;

15)
$(dirname $0)/exec_sata.sh 015_sata_write_ram_to_sata_10MB_has_data.sh
sleep 3
;;

16)
$(dirname $0)/exec_sata.sh 016_sata_write_ram_to_sata_100MB_has_data.sh
sleep 3
;;

17)
$(dirname $0)/exec_sata.sh 017_sata_write_ram_to_sata_350MB_has_data.sh
sleep 3
;;

18)
$(dirname $0)/exec_sata.sh 018_sata_write_ram_to_sata_one_folder_has_data.sh
sleep 3
;;

19)
$(dirname $0)/exec_sata.sh 019_sata_write_ram_to_sata_five_folder_has_data.sh
sleep 3
;;

20)
$(dirname $0)/exec_sata.sh 020_sata_exceeds_capacity_write.sh
sleep 3
;;

21)
$(dirname $0)/exec_sata.sh 021_sata_read_sata_to_ram_10MB.sh
sleep 3
;;

22)
$(dirname $0)/exec_sata.sh 022_sata_read_sata_to_ram_100MB.sh
sleep 3
;;

23)
$(dirname $0)/exec_sata.sh 023_sata_read_sata_to_ram_350MB.sh
sleep 3
;;

24)
$(dirname $0)/exec_sata.sh 024_sata_read_sata_to_ram_one_folder.sh
sleep 3
;;

25)
$(dirname $0)/exec_sata.sh 025_sata_read_sata_to_ram_five_folder.sh
sleep 3
;;

26)
$(dirname $0)/exec_sata.sh 026_sata_simultaneously_copy_ram_and_sata_100MB.sh
sleep 3
;;

27)
$(dirname $0)/exec_sata.sh 027_sata_simultaneously_copy_ram_and_sata_200MB.sh
sleep 3
;;

28)
$(dirname $0)/exec_sata.sh 028_sata_simultaneously_copy_inner_sata_200MB.sh
sleep 3
;;

29)
$(dirname $0)/exec_sata.sh 029_sata_simultaneously_copy_inner_sata_1G.sh
sleep 3
;;

30)
$(dirname $0)/exec_sata.sh 030_sata_write_speed.sh
sleep 3
;;

31)
$(dirname $0)/exec_sata.sh 031_sata_read_speed.sh
sleep 3
;;

32)
$(dirname $0)/exec_sata.sh 032_sata_interrupt_counter.sh
sleep 3
;;

33)
$(dirname $0)/exec_sata.sh 033_sata_unbind_bind_write_data.sh
sleep 3
;;

34)
$(dirname $0)/exec_sata.sh 034_sata_suspend_inside_write_data.sh 1
sleep 3
;;

35)
$(dirname $0)/exec_sata.sh 035_sata_suspend_inside_read_data.sh 1
sleep 3
;;

36)
$(dirname $0)/exec_sata.sh 036_sata_suspend_while_write_data.sh 1
sleep 3
;;

37)
$(dirname $0)/exec_sata.sh 037_sata_suspend_while_read_data.sh 1
sleep 3
;;

40)
$(dirname $0)/exec_sata.sh 040_sata_ctrc_write_data.sh
sleep 3
;;

41)
$(dirname $0)/exec_sata.sh 041_sata_ctrz_write_data.sh
sleep 3
;;

42)
$(dirname $0)/exec_sata.sh 042_sata_test_block_over_seek.sh
sleep 3
;;

43)
$(dirname $0)/exec_sata.sh 043_sata_test_block_ok.sh
sleep 3
;;

44)
$(dirname $0)/exec_sata.sh 044_sata_test_block_by_last_block.sh
sleep 3
;;

45)
$(dirname $0)/exec_sata.sh 045_sata_test_block_over_count.sh
sleep 3
;;

46)
$(dirname $0)/exec_sata.sh 046_sata_smp_test_multiple_cpu.sh
sleep 3
;;

47)
$(dirname $0)/exec_sata.sh 047_sata_write_ram_to_sata_100_times.sh
sleep 3
;;

48)
$(dirname $0)/exec_sata.sh 048_sata_read_sata_to_ram_100_times.sh
sleep 3
;;

esac
