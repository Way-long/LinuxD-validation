#!/bin/sh
# sdhi device driver autotest shell-script

set -a
#set -x

case "$1" in

1)
$(dirname $0)/exec_sdhi.sh 001_sdhi_check_dmesg.sh
sleep 3
;;

2)
$(dirname $0)/exec_sdhi.sh 002_sdhi_check_interrupt.sh
sleep 3
;;

7)
$(dirname $0)/exec_sdhi.sh 007_sdhi_create_partion_ext3_system.sh
sleep 3
;;

8)
$(dirname $0)/exec_sdhi.sh 008_sdhi_write_ram_to_sdhi0_10MB.sh
sleep 3
;;

9)
$(dirname $0)/exec_sdhi.sh 009_sdhi_write_ram_to_sdhi0_100MB.sh
sleep 3
;;

10)
$(dirname $0)/exec_sdhi.sh 010_sdhi_write_ram_to_sdhi0_350MB.sh
sleep 3
;;

11)
$(dirname $0)/exec_sdhi.sh 011_sdhi_write_ram_to_sdhi0_one_folder.sh
sleep 3
;;

12)
$(dirname $0)/exec_sdhi.sh 012_sdhi_write_ram_to_sdhi0_five_folder.sh
sleep 3
;;

13)
$(dirname $0)/exec_sdhi.sh 013_sdhi_write_ram_to_sdhi0_10MB_has_data.sh
sleep 3
;;

14)
$(dirname $0)/exec_sdhi.sh 014_sdhi_write_ram_to_sdhi0_100MB_has_data.sh
sleep 3
;;

15)
$(dirname $0)/exec_sdhi.sh 015_sdhi_write_ram_to_sdhi0_350MB_has_data.sh
sleep 3
;;

16)
$(dirname $0)/exec_sdhi.sh 016_sdhi_write_ram_to_sdhi0_one_folder_has_data.sh
sleep 3
;;

17)
$(dirname $0)/exec_sdhi.sh 017_sdhi_write_ram_to_sdhi0_five_folder_has_data.sh
sleep 3
;;

18)
$(dirname $0)/exec_sdhi.sh 018_sdhi_exceeds_capacity_write_sdhi0.sh
sleep 3
;;

19)
$(dirname $0)/exec_sdhi.sh 019_sdhi_read_sdhi0_to_ram_10MB.sh
sleep 3
;;

20)
$(dirname $0)/exec_sdhi.sh 020_sdhi_read_sdhi0_to_ram_100MB.sh
sleep 3
;;

21)
$(dirname $0)/exec_sdhi.sh 021_sdhi_read_sdhi0_to_ram_350MB.sh
sleep 3
;;

22)
$(dirname $0)/exec_sdhi.sh 022_sdhi_read_sdhi0_to_ram_one_folder.sh
sleep 3
;;

23)
$(dirname $0)/exec_sdhi.sh 023_sdhi_read_sdhi0_to_ram_five_folder.sh
sleep 3
;;

24)
$(dirname $0)/exec_sdhi.sh 024_sdhi_write_ram_to_sdhi3_10MB.sh
sleep 3
;;

25)
$(dirname $0)/exec_sdhi.sh 025_sdhi_write_ram_to_sdhi3_100MB.sh
sleep 3
;;

26)
$(dirname $0)/exec_sdhi.sh 026_sdhi_write_ram_to_sdhi3_350MB.sh
sleep 3
;;

27)
$(dirname $0)/exec_sdhi.sh 027_sdhi_write_ram_to_sdhi3_one_folder.sh
sleep 3
;;

28)
$(dirname $0)/exec_sdhi.sh 028_sdhi_write_ram_to_sdhi3_five_folder.sh
sleep 3
;;

29)
$(dirname $0)/exec_sdhi.sh 029_sdhi_write_ram_to_sdhi3_10MB_has_data.sh
sleep 3
;;

30)
$(dirname $0)/exec_sdhi.sh 030_sdhi_write_ram_to_sdhi3_100MB_has_data.sh
sleep 3
;;

31)
$(dirname $0)/exec_sdhi.sh 031_sdhi_write_ram_to_sdhi3_350MB_has_data.sh
sleep 3
;;

32)
$(dirname $0)/exec_sdhi.sh 032_sdhi_write_ram_to_sdhi3_one_folder_has_data.sh
sleep 3
;;

33)
$(dirname $0)/exec_sdhi.sh 033_sdhi_write_ram_to_sdhi3_five_folder_has_data.sh
sleep 3
;;

34)
$(dirname $0)/exec_sdhi.sh 034_sdhi_exceeds_capacity_write_sdhi3.sh
sleep 3
;;

35)
$(dirname $0)/exec_sdhi.sh 035_sdhi_read_sdhi3_to_ram_10MB.sh
sleep 3
;;

36)
$(dirname $0)/exec_sdhi.sh 036_sdhi_read_sdhi3_to_ram_100MB.sh
sleep 3
;;

37)
$(dirname $0)/exec_sdhi.sh 037_sdhi_read_sdhi3_to_ram_350MB.sh
sleep 3
;;

38)
$(dirname $0)/exec_sdhi.sh 038_sdhi_read_sdhi3_to_ram_one_folder.sh
sleep 3
;;

39)
$(dirname $0)/exec_sdhi.sh 039_sdhi_read_sdhi3_to_ram_five_folder.sh
sleep 3
;;

40)
$(dirname $0)/exec_sdhi.sh 040_sdhi_write_sd0_to_sd3_10MB.sh
sleep 3
;;

41)
$(dirname $0)/exec_sdhi.sh 041_sdhi_write_sd0_to_sd3_100MB.sh
sleep 3
;;

42)
$(dirname $0)/exec_sdhi.sh 042_sdhi_write_sd0_to_sd3_one_folder.sh
sleep 3
;;

43)
$(dirname $0)/exec_sdhi.sh 043_sdhi_write_sd0_to_sd3_five_folder.sh
sleep 3
;;

44)
$(dirname $0)/exec_sdhi.sh 044_sdhi_write_sd3_to_sd0_10M.sh
sleep 3
;;

45)
$(dirname $0)/exec_sdhi.sh 045_sdhi_write_sd3_to_sd0_100MB.sh
sleep 3
;;

46)
$(dirname $0)/exec_sdhi.sh 046_sdhi_write_sd3_to_sd0_one_folder.sh
sleep 3
;;

47)
$(dirname $0)/exec_sdhi.sh 047_sdhi_write_sd3_to_sd0_five_folder.sh
sleep 3
;;

50)
$(dirname $0)/exec_sdhi.sh 050_sdhi_simultaneously_copy_ram_and_sdhi0_100MB.sh
sleep 3
;;

51)
$(dirname $0)/exec_sdhi.sh 051_sdhi_simultaneously_copy_ram_and_sdhi0_200MB.sh
sleep 3
;;

52)
$(dirname $0)/exec_sdhi.sh 052_sdhi_simultaneously_copy_ram_and_sdhi3_100MB.sh
sleep 3
;;

53)
$(dirname $0)/exec_sdhi.sh 053_sdhi_simultaneously_copy_ram_and_sdhi3_200MB.sh
sleep 3
;;

54)
$(dirname $0)/exec_sdhi.sh 054_sdhi_simultaneously_copy_sd0_and_sd3_500MB.sh
sleep 3
;;

55)
$(dirname $0)/exec_sdhi.sh 055_sdhi_simultaneously_copy_sd0_and_sd3_10MB.sh
sleep 3
;;

56)
$(dirname $0)/exec_sdhi.sh 056_sdhi_simultaneously_copy_sd0_and_sd3_100MB.sh
sleep 3
;;

57)
$(dirname $0)/exec_sdhi.sh 057_sdhi_sd0_write_speed.sh
sleep 3
;;

58)
$(dirname $0)/exec_sdhi.sh 058_sdhi_sd0_read_speed.sh
sleep 3
;;

59)
$(dirname $0)/exec_sdhi.sh 059_sdhi_sd3_write_speed.sh
sleep 3
;;

60)
$(dirname $0)/exec_sdhi.sh 060_sdhi_sd3_read_speed.sh
sleep 3
;;

61)
$(dirname $0)/exec_sdhi.sh 061_sdhi_unbind_bind_sdhi0.sh
sleep 3
;;

62)
$(dirname $0)/exec_sdhi.sh 062_sdhi_unbind_bind_sdhi3.sh
sleep 3
;;

63)
$(dirname $0)/exec_sdhi.sh 063_sdhi_suspend_inside_write_data.sh 1
sleep 3
;;

64)
$(dirname $0)/exec_sdhi.sh 064_sdhi_suspend_inside_read_data.sh 1
sleep 3
;;

71)
$(dirname $0)/exec_sdhi.sh 071_sdhi_ctr+c_write_ram_to_sdhi0.sh
sleep 3
;;

72)
$(dirname $0)/exec_sdhi.sh 072_sdhi_ctr+z_write_ram_to_sdhi0.sh
sleep 3
;;

73)
$(dirname $0)/exec_sdhi.sh 073_sdhi_ctr+c_write_ram_to_sdhi3.sh
sleep 3
;;

74)
$(dirname $0)/exec_sdhi.sh 074_sdhi_ctr+z_write_ram_to_sdhi3.sh
sleep 3
;;

77)
$(dirname $0)/exec_sdhi.sh 077_sdhi_test_block_over_seek.sh
sleep 3
;;

78)
$(dirname $0)/exec_sdhi.sh 078_sdhi_test_block_ok.sh
sleep 3
;;

79)
$(dirname $0)/exec_sdhi.sh 079_sdhi_test_block_by_last_block.sh
sleep 3
;;

80)
$(dirname $0)/exec_sdhi.sh 080_sdhi_test_block_over_count.sh
sleep 3
;;

81)
$(dirname $0)/exec_sdhi.sh 081_sdhi_smp_test_multiple_cpu_one_sd_card.sh
sleep 3
;;

82)
$(dirname $0)/exec_sdhi.sh 082_sdhi_smp_test_multiple_cpu_multi_sd_card.sh
sleep 3
;;

83)
$(dirname $0)/exec_sdhi.sh 083_sdhi_smp_test_one_cpu_multiple_sd_card.sh
sleep 3
;;

84)
$(dirname $0)/exec_sdhi.sh 084_sdhi_write_ram_to_sdhi0_350MB_100_times.sh
sleep 3
;;

85)
$(dirname $0)/exec_sdhi.sh 085_sdhi_read_sdhi0_to_ram_350MB_100_times.sh
sleep 3
;;

86)
$(dirname $0)/exec_sdhi.sh 086_sdhi_write_ram_to_sdhi3_350MB_100_times.sh
sleep 3
;;

87)
$(dirname $0)/exec_sdhi.sh 087_sdhi_read_sdhi3_to_ram_350MB_100_times.sh
sleep 3
;;

esac