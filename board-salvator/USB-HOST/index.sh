#!/bin/sh
# usb host device driver autotest shell-script

set -a
#set -x

case "$1" in

1)	
$(dirname $0)/exec_usb.sh 001_check_dmesg.sh
sleep 3
;;

2)
$(dirname $0)/exec_usb.sh 002_check_interrupt.sh
sleep 3
;;

6)
$(dirname $0)/exec_usb.sh 006_usb2.0-create-partion-ext3-system.sh
sleep 3
;;

7)
$(dirname $0)/exec_usb.sh 007_usb2.0_write-RAM-to-USB_10MB.sh
sleep 3
;;

8)
$(dirname $0)/exec_usb.sh 008_usb2.0_write-RAM-to-USB_100MB.sh
sleep 3
;;


9)
$(dirname $0)/exec_usb.sh 009_usb2.0_write-RAM-to-USB_350MB.sh
sleep 3
;;

10)
$(dirname $0)/exec_usb.sh 010_usb2.0_write-stage1-folder-USB-RAM.sh
sleep 3
;;

11)
$(dirname $0)/exec_usb.sh 011_usb2.0_write-stage5-folder-USB-RAM.sh
sleep 3
;;

12)
$(dirname $0)/exec_usb.sh 012_usb2.0_write-RAM-to-USB_have_data_10MB.sh
sleep 3
;;

13)
$(dirname $0)/exec_usb.sh 013_usb2.0_write-RAM-to-USB_have_data_100MB.sh
sleep 3
;;

14)
$(dirname $0)/exec_usb.sh 014_usb2.0_write-RAM-to-USB_have_data_350MB.sh
sleep 3
;;

15)
$(dirname $0)/exec_usb.sh 015_usb2.0_write-stage1-folder-USB-RAM_have_data.sh
sleep 3
;;

16)
$(dirname $0)/exec_usb.sh 016_usb2.0_write-stage5-folder-USB-RAM_have_data.sh
sleep 3
;;

17)
$(dirname $0)/exec_usb.sh 017_usb2.0_read_USB_to_RAM_10MB.sh
sleep 3
;;

18)
$(dirname $0)/exec_usb.sh 018_usb2.0_read_USB_to_RAM_100MB.sh
sleep 3
;;

19)
$(dirname $0)/exec_usb.sh 019_usb2.0_read_USB_to_RAM_350MB.sh
sleep 3
;;

20)
$(dirname $0)/exec_usb.sh 020_usb2.0_read-stage1-folder-USB-RAM.sh
sleep 3
;;

21)
$(dirname $0)/exec_usb.sh 021_usb2.0_read-stage5-folder-USB-RAM.sh
sleep 3
;;

22)
$(dirname $0)/exec_usb.sh 022_usb2.0_write-speed.sh
sleep 3
;;

23)
$(dirname $0)/exec_usb.sh 023_usb2.0_read-speed.sh
sleep 3
;;

24)
$(dirname $0)/exec_usb.sh 024_usb2.0-exceeds-capacity_write-USB.sh
sleep 3
;;

25)
$(dirname $0)/exec_usb.sh 025_usb2.0-suspend.sh 1
sleep 3
;;

26)
$(dirname $0)/exec_usb.sh 026_usb2.0ch2-create-partion-ext3-system.sh
sleep 3
;;

27)
$(dirname $0)/exec_usb.sh 027_usb2.0ch2_write-RAM-to-USB_10MB.sh
sleep 3
;;

28)
$(dirname $0)/exec_usb.sh 028_usb2.0ch2_write-RAM-to-USB_100MB.sh
sleep 3
;;

29)
$(dirname $0)/exec_usb.sh 029_usb2.0ch2_write-RAM-to-USB_350MB.sh
;;

30)
$(dirname $0)/exec_usb.sh 030_usb2.0ch2_write-stage1-folder-USB-RAM.sh
sleep 3
;;

31)
$(dirname $0)/exec_usb.sh 031_usb2.0ch2_write-stage5-folder-USB-RAM.sh
sleep 3
;;

32)
$(dirname $0)/exec_usb.sh 032_usb2.0ch2_write-RAM-to-USB_have_data_10MB.sh
sleep 3
;;

33)
$(dirname $0)/exec_usb.sh 033_usb2.0ch2_write-RAM-to-USB_have_data_100MB.sh
sleep 3
;;

34)
$(dirname $0)/exec_usb.sh 034_usb2.0ch2_write-RAM-to-USB_have_data_350MB.sh
sleep 3
;;

35)
$(dirname $0)/exec_usb.sh 035_usb2.0ch2_write-stage1-folder-USB-RAM_have_data.sh
sleep 3
;;

36)
$(dirname $0)/exec_usb.sh 036_usb2.0ch2_write-stage5-folder-USB-RAM_have_data.sh
sleep 3
;;

37)
$(dirname $0)/exec_usb.sh 037_usb2.0ch2_read_USB_to_RAM_10MB.sh
sleep 3
;;

38)
$(dirname $0)/exec_usb.sh 038_usb2.0ch2_read_USB_to_RAM_100MB.sh
sleep 3
;;

39)
$(dirname $0)/exec_usb.sh 039_usb2.0ch2_read_USB_to_RAM_350MB.sh
sleep 3
;;

40)
$(dirname $0)/exec_usb.sh 040_usb2.0ch2_read-stage1-folder-USB-RAM.sh
sleep 3
;;

41)
$(dirname $0)/exec_usb.sh 041_usb2.0ch2_read-stage5-folder-USB-RAM.sh
sleep 3
;;

42)
$(dirname $0)/exec_usb.sh 042_usb2.0ch2_write-speed.sh
sleep 3
;;

43)
$(dirname $0)/exec_usb.sh 043_usb2.0ch2_read-speed.sh
sleep 3
;;

44)
$(dirname $0)/exec_usb.sh 044_usb2.0ch2-exceeds-capacity_write-USB.sh
sleep 3
;;

45)
$(dirname $0)/exec_usb.sh 045_usb2.0ch2-suspend.sh
sleep 3
;;

46)
$(dirname $0)/exec_usb.sh 045_usb2.0ch2-suspend.sh 1
sleep 3
;;

56)
$(dirname $0)/exec_usb.sh 056_usb3.0-create-partion-ext3-system.sh
sleep 3
;;

57)
$(dirname $0)/exec_usb.sh 057_usb3.0_write-RAM-to-USB_10MB.sh
sleep 3
;;

58)
$(dirname $0)/exec_usb.sh 058_usb3.0_write-RAM-to-USB_100MB.sh
sleep 3
;;

59)
$(dirname $0)/exec_usb.sh 059_usb3.0_write-RAM-to-USB_350MB.sh
sleep 3
;;

60)
$(dirname $0)/exec_usb.sh 060_usb3.0_write-stage1-folder-USB-RAM.sh
sleep 3
;;

61)
$(dirname $0)/exec_usb.sh 061_usb3.0_write-stage5-folder-USB-RAM.sh
sleep 3
;;

62)
$(dirname $0)/exec_usb.sh 062_usb3.0_write-RAM-to-USB_have_data_10MB.sh
sleep 3
;;

63)
$(dirname $0)/exec_usb.sh 063_usb3.0_write-RAM-to-USB_have_data_100MB.sh
sleep 3
;;

64)
$(dirname $0)/exec_usb.sh 064_usb3.0_write-RAM-to-USB_have_data_350MB.sh
sleep 3
;;

65)
$(dirname $0)/exec_usb.sh 065_usb3.0_write-stage1-folder-USB-RAM_have_data.sh
sleep 3
;;

66)
$(dirname $0)/exec_usb.sh 066_usb3.0_write-stage5-folder-USB-RAM_have_data.sh
sleep 3
;;

67)
$(dirname $0)/exec_usb.sh 067_usb3.0_read_USB_to_RAM_10MB.sh
sleep 3
;;

68)
$(dirname $0)/exec_usb.sh 068_usb3.0_read_USB_to_RAM_100MB.sh
sleep 3
;;

69)
$(dirname $0)/exec_usb.sh 069_usb3.0_read_USB_to_RAM_350MB.sh
sleep 3
;;

70)
$(dirname $0)/exec_usb.sh 070_usb3.0_read-stage1-folder-USB-RAM.sh
sleep 3
;;

71)
$(dirname $0)/exec_usb.sh 071_usb3.0_read-stage5-folder-USB-RAM.sh
sleep 3
;;

72)
$(dirname $0)/exec_usb.sh 072_usb3.0_write-speed.sh
sleep 3
;;

73)
$(dirname $0)/exec_usb.sh 073_usb3.0_read-speed.sh
sleep 3
;;

74)
$(dirname $0)/exec_usb.sh 074_usb3.0-exceeds-capacity_write-USB.sh
sleep 3
;;

75)
$(dirname $0)/exec_usb.sh 075_usb3.0-suspend.sh
sleep 3
;;

76)
$(dirname $0)/exec_usb.sh 076_write-USB2.0ch1-to-USB2.0ch2_100MB.sh
sleep 3
;;

77)
$(dirname $0)/exec_usb.sh 077_write-USB2.0ch1-to-USB2.0ch2_500MB.sh
sleep 3
;;

78)
$(dirname $0)/exec_usb.sh 078_write-USB2.0ch1-to-USB2.0ch2_1G.sh
sleep 3
;;

79)
$(dirname $0)/exec_usb.sh 079_write_1_stage_folder_USB2.0ch1-to-USB2.0ch2.sh
sleep 3
;;

80)
$(dirname $0)/exec_usb.sh 080_write_5_stage_folder_USB2.0ch1-to-USB2.0ch2.sh
sleep 3
;;

83)
$(dirname $0)/exec_usb.sh 083_Simultaneously-Write-USB2.0ch1-to-USB2.0ch2_10MB.sh
sleep 3
;;

84)
$(dirname $0)/exec_usb.sh 084_Simultaneously-Write-USB2.0ch1-to-USB2.0ch2_100MB.sh
sleep 3
;;

85)
$(dirname $0)/exec_usb.sh 085_Simultaneously-Write-USB2.0ch1-to-USB2.0ch2_500MB.sh
sleep 3
;;

86)
$(dirname $0)/exec_usb.sh 086_write-USB2.0-to-USB3.0_100MB.sh
sleep 3
;;

87)
$(dirname $0)/exec_usb.sh 087_write-USB2.0-to-USB3.0_500MB.sh
sleep 3
;;

88)
$(dirname $0)/exec_usb.sh 088_write-USB2.0-to-USB3.0_1G.sh
sleep 3
;;

89)
$(dirname $0)/exec_usb.sh 089_write_1_stage_folder_USB2.0-to-USB3.0.sh
sleep 3
;;

90)
$(dirname $0)/exec_usb.sh 090_write_5_stage_folder_USB2.0-to-USB3.0.sh
sleep 3
;;

91)
$(dirname $0)/exec_usb.sh 091_write-USB3.0-to-USB2.0_100MB.sh
sleep 3
;;

92)
$(dirname $0)/exec_usb.sh 092_write-USB3.0-to-USB2.0_500MB.sh
sleep 3
;;

93)
$(dirname $0)/exec_usb.sh 093_write-USB3.0-to-USB2.0_1G.sh
sleep 3
;;

94)
$(dirname $0)/exec_usb.sh 094_write_1_stage_folder_USB3.0-to-USB2.0.sh
sleep 3
;;

95)
$(dirname $0)/exec_usb.sh 095_write_5_stage_folder_USB3.0-to-USB2.0.sh
sleep 3
;;

98)
$(dirname $0)/exec_usb.sh 098_Simultaneously-Write-ram-to-USB2.0_200MB.sh
sleep 3
;;

99)
$(dirname $0)/exec_usb.sh 099_Simultaneously-Write-ram-to-USB3.0_200MB.sh
sleep 3
;;

100)
$(dirname $0)/exec_usb.sh 100_Simultaneously-Write-USB2.0-to-USB3.0_10MB.sh
sleep 3
;;

101)
$(dirname $0)/exec_usb.sh 101_Simultaneously-Write-USB2.0-to-USB3.0_100MB.sh
sleep 3
;;

102)
$(dirname $0)/exec_usb.sh 102_Simultaneously-Write-USB2.0-to-USB3.0_500MB.sh
sleep 3
;;

123)
$(dirname $0)/exec_usb.sh 123_hub_write_data_ram_to_USB2.0_10MB.sh
sleep 3
;;

124)
$(dirname $0)/exec_usb.sh 124_hub_write_data_ram_to_USB3.0_10MB.sh
sleep 3
;;

125)
$(dirname $0)/exec_usb.sh 125_hub_write_speed_USB2.0.sh
sleep 3
;;

126)
$(dirname $0)/exec_usb.sh 126_hub_read_speed_USB2.0.sh
sleep 3
;;

127)
$(dirname $0)/exec_usb.sh 127_hub_write_speed_USB3.0.sh
sleep 3
;;

128)
$(dirname $0)/exec_usb.sh 128_hub_read_speed_USB3.0.sh
sleep 3
;;

129)
$(dirname $0)/exec_usb.sh 129_hub_write_data_USB2.0_to_USB3.0_100MB.sh
sleep 3
;;

130)
$(dirname $0)/exec_usb.sh 130_hub_write_data_USB3.0_to_USB2.0_100MB.sh
sleep 3
;;

131)
$(dirname $0)/exec_usb.sh 131_hub_suspend_usb2.0.sh 1
sleep 3
;;

132)
$(dirname $0)/exec_usb.sh 132_hub_suspend_USB3.0.sh 1
sleep 3
;;

134)
$(dirname $0)/exec_usb.sh 134_hdd-create-partion-ext3-system.sh
sleep 3
;;

135)
$(dirname $0)/exec_usb.sh 135_hdd_write-RAM-to-USB2.0_10MB.sh
sleep 3
;;

136)
$(dirname $0)/exec_usb.sh 136_hdd_write-RAM-to-USB2.0_100MB.sh
sleep 3
;;

137)
$(dirname $0)/exec_usb.sh 137_hdd_write-RAM-to-USB2.0_350MB.sh
sleep 3
;;

138)
$(dirname $0)/exec_usb.sh 138_hdd_write-stage1-folder-USB2.0-RAM.sh
sleep 3
;;

139)
$(dirname $0)/exec_usb.sh 139_hdd_write-stage5-folder-USB2.0-RAM.sh
sleep 3
;;

140)
$(dirname $0)/exec_usb.sh 140_hdd_read_USB2.0_to_RAM_10MB.sh
sleep 3
;;

141)
$(dirname $0)/exec_usb.sh 141_hdd_read_USB2.0_to_RAM_100MB.sh
sleep 3
;;

142)
$(dirname $0)/exec_usb.sh 142_hdd_read_USB2.0_to_RAM_350MB.sh
sleep 3
;;

143)
$(dirname $0)/exec_usb.sh 143_hdd_read-stage1-folder-USB2.0-RAM.sh
sleep 3
;;

144)
$(dirname $0)/exec_usb.sh 144_hdd_read-stage5-folder-USB2.0-RAM.sh
sleep 3
;;

145)
$(dirname $0)/exec_usb.sh 145_hdd-exceeds-capacity_write-USB2.0.sh
sleep 3
;;

146)
$(dirname $0)/exec_usb.sh 146_hdd_write-USB2.0-to-USB3.0_1GB.sh
sleep 3
;;

147)
$(dirname $0)/exec_usb.sh 147_hdd_write-USB3.0-to-USB2.0_1GB.sh
sleep 3
;;

148)
$(dirname $0)/exec_usb.sh 148_hdd_suspend.sh
sleep 3
;;

167)
$(dirname $0)/exec_usb.sh 167_usb_test_block_over_seek.sh
sleep 3
;;

168)
$(dirname $0)/exec_usb.sh 168_usb_test_block_ok.sh
sleep 3
;;

169)
$(dirname $0)/exec_usb.sh 169_usb_test_block_by_last_block.sh
sleep 3
;;

170)
$(dirname $0)/exec_usb.sh 170_usb_test_block_over_count.sh
sleep 3
;;

171)
$(dirname $0)/exec_usb.sh 171_usb_smp_test_multiple_cpu_one_usb.sh
sleep 3
;;

172)
$(dirname $0)/exec_usb.sh 172_usb_smp_test_multiple_cpu_multi_usb.sh
sleep 3
;;

173)
$(dirname $0)/exec_usb.sh 173_usb_smp_test_one_cpu_multiple_usb.sh
sleep 3
;;

174)
$(dirname $0)/exec_usb.sh 174_usb_stress_USB2.0.sh
sleep 3
;;

175)
$(dirname $0)/exec_usb.sh 175_usb_stress_USB3.0.sh
sleep 3
;;

esac
