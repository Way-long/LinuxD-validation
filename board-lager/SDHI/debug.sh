#!/bin/sh

set -a
#set -x

. ./config_sdhi.sh

echo "================================================================================="
echo "|                              DEBUG SDHI DRIVER                                |"
echo "================================================================================="

case "$1" in

1)
echo "1)***************************sdhi dmesg feature test*****************************"
$(dirname $0)/dmesg.sh 
sleep 3
;;

2)
echo "2)******************************sdhi interrupts**********************************"
$(dirname $0)/proc-interrupts.sh
sleep 3
;;

7)
echo "7)*************************create-partion-ext3-system-SD0************************"
$(dirname $0)/create-partion-ext3-system-SD1.sh 
sleep 3
$(dirname $0)/create-partion-ext3-system-SD2.sh
sleep 3
;;

8)
echo "8->10)**************************Write-RAM-to-SD1*********************************"
$(dirname $0)/write-RAM-to-SD1.sh
sleep 3
;;

11)
echo "11,22)*******************write-read-stage1_folder-SD1-RAM************************"
$(dirname $0)/write-read-stage1_folder-SD1-RAM.sh
sleep 3
;;

12)
echo "12,23)*******************write-read-stage5_folder-SD1-RAM************************"
$(dirname $0)/write-read-stage5_folder-SD1-RAM.sh
sleep 3
;;

13)
echo "13->15)*******************write-RAM-to-SD1_have_data*****************************"
$(dirname $0)/write-RAM-to-SD1_have_data.sh
sleep 3
;;

16)
echo "16)*****************write-read-stage1_folder-RAM-to-SD1-have-data****************"
$(dirname $0)/write-stage1_folder-RAM-to-SD1_have-data.sh
sleep 3
;;

17)
echo "17)*****************write-read-stage5_folder-RAM-to-SD1-have-data****************"
$(dirname $0)/write-stage5_folder-RAM-to-SD1_have-data.sh
sleep 3
;;

18)
echo "18)***************************test-nospace-SD1***********************************"
$(dirname $0)/exceeds-capacity-write-SD1.sh
sleep 3
;;

19)
echo "19->21)************************write-SD1-to-RAM**********************************"
$(dirname $0)/write-SD1-to-RAM.sh
sleep 3
;;

24)
echo "24->26)**************************Write-RAM-to-SD2********************************"
$(dirname $0)/write-RAM-to-SD2.sh
sleep 3
;;

27)
echo "27,38)*******************write-read-stage1_folder-SD2-RAM************************"
$(dirname $0)/write-read-stage1_folder-SD2-RAM.sh
sleep 3
;;

28)
echo "28,39)*******************write-read-stage5_folder-SD2-RAM************************"
$(dirname $0)/write-read-stage5_folder-SD2-RAM.sh
sleep 3
;;

29)
echo "29->31)*******************write-RAM-to-SD2_have_data*****************************"
$(dirname $0)/write-RAM-to-SD2_have_data.sh
sleep 3
;;

32)
echo "32)*****************write-read-stage1_folder-RAM-to-SD2-have-data****************"
$(dirname $0)/write-stage1_folder-RAM-to-SD2_have-data.sh
sleep 3
;;

33)
echo "33)*****************write-read-stage5_folder-RAM-to-SD2-have-data****************"
$(dirname $0)/write-stage5_folder-RAM-to-SD2_have-data.sh
sleep 3
;;

34)
echo "34)***************************test-nospace-SD2***********************************"
$(dirname $0)/exceeds-capacity-write-SD2.sh
sleep 3
;;

35)
echo "35->37)************************write-SD2-to-RAM**********************************"
$(dirname $0)/write-SD2-to-RAM.sh
sleep 3
;;

40)
echo "40->41,44->45)********************Write-SD1-to-SD2*******************************"
$(dirname $0)/write-read-SD1-SD2.sh
sleep 3
;;

42)
echo "42,46)*******************write-read-stage1_folder-SD1-SD2************************"
$(dirname $0)/write-read-stage1_folder-SD1-SD2.sh
sleep 3
;;

43)
echo "43,47)*******************write-read-stage5_folder-SD1-SD2************************"
$(dirname $0)/write-read-stage5_folder-SD2-RAM.sh
sleep 3
;;

48)
echo "48)*******************Simultaneously-Write-RAM-to-SD1_SD2************************"
$(dirname $0)/Simultaneously-Write-RAM-to-SD1_SD2.sh
sleep 3
;;

49)
echo "49)*******************Simultaneously-Write-SD1_SD2-to-RAM************************"
$(dirname $0)/Simultaneously-Write-SD1_SD2-to-RAM.sh
sleep 3
;;

50)
echo "50-51)*******************Simultaneously-Write-RAM-SD1****************************"
$(dirname $0)/Simultaneously-Write-RAM-SD1.sh
sleep 3
;;

52)
echo "52-53)*******************Simultaneously-Write-RAM-SD2****************************"
$(dirname $0)/Simultaneously-Write-RAM-SD2.sh
sleep 3
;;

54)
echo "54)**********************Simultaneously-Write-SD1-SD2****************************"
$(dirname $0)/Simultaneously-Write-SD1-SD2.sh
sleep 3
;;

55)
echo "55-56)**********************alternate-50time-SD0-SD1*****************************"
$(dirname $0)/alternate-50time-SD1-SD2.sh
sleep 3
;;

65)
echo "65)************************write speed for SD1 *********************************"
$(dirname $0)/write-speed-SD1.sh
sleep 3
;;

66)
echo "66)*************************read speed for SD1 *********************************"
$(dirname $0)/read-speed-SD1.sh
sleep 3
;;

67)
echo "67)************************write speed for SD2 *********************************"
$(dirname $0)/write-speed-SD2.sh
sleep 3
;;

68)
echo "68)*************************read speed for SD2 *********************************"
$(dirname $0)/read-speed-SD2.sh
sleep 3
;;

73)
echo "73)**************************suspend_inside_write_SD1***************************"
$(dirname $0)/suspend_inside_write_SD1.sh
sleep 3
;;

74)
echo "74)**************************suspend_inside_read_SD1****************************"
$(dirname $0)/suspend_inside_read_SD1.sh
sleep 3
;;

75)
echo "75)**************************suspend_while_write_SD1****************************"
$(dirname $0)/suspend_while_write_SD1.sh
sleep 3
;;

76)
echo "76)**************************suspend_while_read_SD1*****************************"
$(dirname $0)/suspend_while_read_SD1.sh
sleep 3
;;

77)
echo "77)**************************50time-write-SD0-RAM*******************************"
$(dirname $0)/50time-write-SD1-RAM.sh
sleep 3
;;

78)
echo "78)**************************50time-write-RAM-SD0*******************************"
$(dirname $0)/50time-write-RAM-SD1.sh
sleep 3
;;

79)
echo "79)**************************50time-write-SD1-RAM*******************************"
$(dirname $0)/50time-write-SD2-RAM.sh
sleep 3
;;

80)
echo "80)**************************50time-write-RAM-SD1*******************************"
$(dirname $0)/50time-write-RAM-SD2.sh
sleep 3
;;

81)
echo "81)*************************unbind-bind-write-sdhi.0****************************"
$(dirname $0)/unbind-bind-write-sdhi.1.sh
sleep 3
$(dirname $0)/unbind-bind-write-sdhi.2.sh 
sleep 3 
;;

82)
echo "82)*************************ctr_c while copy file ******************************"
$(dirname $0)/ctr_c-write-RAM-to-SD0.sh
sleep 3
$(dirname $0)/ctr_c-write-RAM-to-SD1.sh
sleep 3
;;

83)
echo "83)*************************ctr_z while copy file ******************************"
$(dirname $0)/ctr_z-write-RAM-to-SD0.sh
sleep 3
$(dirname $0)/ctr_z-write-RAM-to-SD1.sh
sleep 3
;;

84)
echo "84-85)*********************clkgate-read-write-mmc******************************"
$(dirname $0)/clkgate-read-write-mmc.sh
sleep 3
;;

89)
echo "89)***********************smp-cpu0_0-write-ram-sdhi0_1**************************"
$(dirname $0)/smp-multicpu-1SD.sh
sleep 3
;;

90)
echo "90)***********************smp-cpu0_0-write-ram-sdhi0_1**************************"
$(dirname $0)/smp-multicpu-mutilSD.sh
sleep 3
;;

91)
echo "91)***********************smp-cpu0_0-write-ram-sdhi0_1**************************"
$(dirname $0)/smp-1cpu-multiSD.sh
sleep 3
;;
esac