#!/bin/sh

set -a
#set -x

. ./config_usb_host.sh

echo "================================================================================="
echo "|                          DEBUG USB HOST DRIVER                                |"
echo "================================================================================="

case "$1" in

1)	
echo "1)**************************Test dmesg USB DRIVER********************************"
$(dirname $0)/dmesg.sh
sleep 3
;;

2)
echo "2)************************Test interrupt USB DRIVER******************************"
$(dirname $0)/proc-interrupts.sh
sleep 3
;;

5)
echo "5)**********************usb2.0-create-partion-ext3-system************************"
$(dirname $0)/usb2.0-create-partion-ext3-system.sh
sleep 3
;;

7)
echo "7->9)************************usb2.0-write-RAM-to-USB*****************************"
$(dirname $0)/usb2.0-write-RAM-to-USB.sh
sleep 3
;;

10)
echo "10,20)*****************usb2.0-write-read-stage1-folder-USB-RAM*******************"
$(dirname $0)/usb2.0-write-read-stage1-folder-USB-RAM.sh
sleep 3
;;

11)
echo "11,21)*****************usb2.0-write-read-stage5-folder-USB-RAM*******************"
$(dirname $0)/usb2.0-write-read-stage5-folder-USB-RAM.sh
sleep 3
;;

12)
echo "12->14)*****************usb2.0-write-RAM-to-USB_have_data************************"
$(dirname $0)/usb2.0-write-RAM-to-USB_have_data.sh
sleep 3
;;

15)
echo "15)**************usb2.0-write-read-stage1-folder-USB-RAM_have_data***************"
$(dirname $0)/usb2.0-write-read-stage1-folder-USB-RAM_have_data.sh
sleep 3
;;


16)
echo "16)**************usb2.0-write-read-stage5-folder-USB-RAM_have_data***************"
$(dirname $0)/usb2.0-write-read-stage5-folder-USB-RAM_have_data.sh
sleep 3
;;

17)
echo "17->19)***********************usb2.0-write-USB-to-RAM****************************"
$(dirname $0)/usb2.0-write-USB-to-RAM.sh
sleep 3
;;

22)
echo "22)*******************************usb2.0-read-speed******************************"
$(dirname $0)/usb2.0-read-speed.sh
sleep 3
;;

23)
echo "23)******************************usb2.0-write-speed******************************"
$(dirname $0)/usb2.0-write-speed.sh
sleep 3
;;

24)
echo "24-25)*******************usb2.0-exceeds-capacity-write-USB***********************"
$(dirname $0)/usb2.0-exceeds-capacity-write-USB.sh
sleep 3
;;

26)
echo "26)**************************usb2.0-while-read-remove-device*********************"
$(dirname $0)/usb2.0-while-read-remove-device.sh
sleep 3
;;

27)
echo "27)**************************usb2.0-while-write-remove-device********************"
$(dirname $0)/usb2.0-while-write-remove-device.sh
sleep 3
;;

28)
echo "28)******************************usb2.0-suspend-test*****************************"
$(dirname $0)/usb2.0-suspend.sh
sleep 3
;;

41)
echo "41)**************************Test dmesg USB DRIVER*******************************"
$(dirname $0)/dmesg.sh
sleep 3
;;

42)
echo "42)************************Test interrupt USB DRIVER*****************************"
$(dirname $0)/proc-interrupts.sh
sleep 3
;;

45)
echo "45)**********************usb3.0-create-partion-ext3-system***********************"
$(dirname $0)/usb3.0-create-partion-ext3-system.sh
sleep 3
;;

47)
echo "47->49)************************sb2.0-write-RAM-to-USB****************************"
$(dirname $0)/usb3.0-write-RAM-to-USB.sh
sleep 3
;;

52)
echo "52->54)*****************usb3.0-write-RAM-to-USB_have_data************************"
$(dirname $0)/usb3.0-write-RAM-to-USB_have_data.sh
sleep 3
;;

55)
echo "55)**************usb3.0-write-read-stage1-folder-USB-RAM_have_data***************"
$(dirname $0)/usb3.0-write-read-stage1-folder-USB-RAM_have_data.sh
sleep 3
;;

56)
echo "56)**************usb3.0-write-read-stage5-folder-USB-RAM_have_data***************"
$(dirname $0)/usb3.0-write-read-stage5-folder-USB-RAM_have_data.sh
sleep 3
;;

57)
echo "57->59)***********************usb3.0-write-USB-to-RAM****************************"
$(dirname $0)/usb3.0-write-USB-to-RAM.sh
sleep 3
;;

50)
echo "50,60)*****************usb3.0-write-read-stage1-folder-USB-RAM*******************"
$(dirname $0)/usb3.0-write-read-stage1-folder-USB-RAM.sh
sleep 3
;;

51)
echo "51,61)*****************usb3.0-write-read-stage5-folder-USB-RAM*******************"
$(dirname $0)/usb3.0-write-read-stage5-folder-USB-RAM.sh
sleep 3
;;

62)
echo "62)*******************************usb3.0-read-speed******************************"
$(dirname $0)/usb3.0-read-speed.sh
sleep 3
;;

63)
echo "63)******************************usb3.0-write-speed******************************"
$(dirname $0)/usb3.0-write-speed.sh
sleep 3
;;

64)
echo "64-65)*******************usb3.0-exceeds-capacity-write-USB***********************"
$(dirname $0)/usb3.0-exceeds-capacity-write-USB.sh
sleep 3
;;

66)
echo "66)**************************usb3.0-while-read-remove-device*********************"
$(dirname $0)/usb3.0-while-read-remove-device.sh
sleep 3
;;

67)
echo "67)**************************usb3.0-while-write-remove-device********************"
$(dirname $0)/usb3.0-while-write-remove-device.sh
sleep 3
;;

68)
echo "68)******************************usb3.0-suspend-test*****************************"
$(dirname $0)/usb3.0-suspend.sh
sleep 3
;;

69)
echo "69->71)***********************write usb2.0 to usb3.0*****************************"
$(dirname $0)/write-USB2.0-to-USB3.0.sh
sleep 3
;;

72)
echo "72)********************write-stage1-folder-USB2.0-USB3.0*************************"
$(dirname $0)/write-stage1-folder-USB2.0-USB3.0.sh
sleep 3
;;

73)
echo "73)********************write-stage5-folder-USB2.0-USB3.0*************************"
$(dirname $0)/write-stage5-folder-USB2.0-USB3.0.sh
sleep 3
;;

74)
echo "74->76)***********************write usb3.0 to usb2.0*****************************"
$(dirname $0)/write-USB3.0-to-USB2.0.sh
sleep 3
;;

77)
echo "77)********************write-stage1-folder-USB3.0-USB2.0*************************"
$(dirname $0)/write-stage1-folder-USB3.0-USB2.0.sh
sleep 3
;;

78)
echo "78)********************write-stage5-folder-USB3.0-USB2.0*************************"
$(dirname $0)/write-stage5-folder-USB3.0-USB2.0.sh
sleep 3
;;

79)
echo "79)******************Simultaneously-Write-RAM-to-USB2.0_USB3.0*******************"
$(dirname $0)/Simultaneously-Write-RAM-to-USB2.0_USB3.0.sh
sleep 3
;;

80)
echo "80)******************Simultaneously-Write-USB2.0_USB3.0-to-RAM*******************"
$(dirname $0)/Simultaneously-Write-USB2.0_USB3.0-to-RAM.sh
sleep 3
;;

81)
echo "81)********************Simultaneously-Write-RAM-USB2.0***************************"
$(dirname $0)/Simultaneously-Write-RAM-USB2.0.sh
sleep 3
;;

82)
echo "82)********************Simultaneously-Write-RAM-USB3.0***************************"
$(dirname $0)/Simultaneously-Write-RAM-USB3.0.sh
sleep 3
;;

83)
echo "83)********************Simultaneously-Write-USB2.0-USB3.0************************"
$(dirname $0)/Simultaneously-Write-USB2.0-USB3.0.sh
sleep 3
;;

84)
echo "84->85)*************50time-Simultaneously-Write-USB2.0-USB3.0 *******************"
$(dirname $0)/50time_Simultaneously-Write-USB2.0-USB3.0.sh
sleep 3
;;

86)
echo "86)*************************** dmesg test usb keyboard **************************"
$(dirname $0)/dmesg_usb_keyboard.sh
sleep 3
;;

87)
echo "87->88)************************* test usb keyboard ******************************"
$(dirname $0)/test_usb_keyboard.sh
sleep 3
;;

89)
echo "89)************************* suspend test usb keyboard **************************"
$(dirname $0)/test_usb_keyboard_suspend.sh
sleep 3
;;

90)
echo "90)*************************** dmesg test usb keyboard **************************"
$(dirname $0)/dmesg_usb_mouse.sh
sleep 3
;;

91)
echo "91)***************************** test usb keyboard ******************************"
$(dirname $0)/test_usb_mouse.sh
sleep 3
;;

92)
echo "92)************************* suspend test usb keyboard **************************"
$(dirname $0)/test_usb_mouse_suspend.sh
sleep 3
;;

100)
echo "100)*************************** dmesg test usb sound ****************************"
$(dirname $0)/dmesg_usb_sound.sh
sleep 3
;;

101)
echo "101->103)********************** test usb sound **********************************"
$(dirname $0)/test_usb_sound.sh
sleep 3
;;

104)
echo "104)*************************** suspend test usb sound **************************"
$(dirname $0)/test_usb_sound.sh
sleep 3
;;

107)
echo "107)***************************Simultaneously-Write-RAM-USB2.0*******************"
$(dirname $0)/hub-Simultaneously-Write-RAM-USB2.0.sh
sleep 3
;;

108)
echo "108)***************************Simultaneously-Write-RAM-USB3.0*******************"
$(dirname $0)/hub-Simultaneously-Write-RAM-USB3.0.sh
sleep 3
;;

109)
echo "109)****************************write-speed-RAM-USB2.0-HUB***********************"
$(dirname $0)/hub-write-speed-USB2.0.sh
sleep 3
;;

110)
echo "110)*****************************read-speed-RAM-USB2.0-HUB***********************"
$(dirname $0)/hub-read-speed-USB2.0.sh
sleep 3
;;

111)
echo "111)*****************************write-speed-RAM-USB3.0-HUB**********************"
$(dirname $0)/hub-write-speed-USB3.0.sh
sleep 3
;;

112)
echo "112)*****************************read-speed-RAM-USB3.0-HUB***********************"
$(dirname $0)/hub-read-speed-USB3.0.sh
sleep 3
;;

113)
echo "113)*****************************write-USB2.0-USB3.0-HUB*************************"
$(dirname $0)/hub-write-USB2.0-to-USB3.0.sh
sleep 3
;;

114)
echo "114)*****************************write-USB3.0-USB2.0-HUB*************************"
$(dirname $0)/hub-write-USB3.0-to-USB2.0.sh
sleep 3
;;

115)
echo "115)*****************************test hub-usb2.0-suspend*************************"
$(dirname $0)/hub-usb2.0-suspend.sh
sleep 3
;;

116)
echo "116)*****************************test hub-usb3.0-suspend*************************"
$(dirname $0)/hub-usb3.0-suspend.sh
sleep 3
;;

117)
echo "117)**************************usb-hub-while-write-remove-device******************"
$(dirname $0)/usb2.0-while-write-remove-device.sh
sleep 3
;;

118)
echo "118)**************************usb-hub-while-write-remove-device******************"
$(dirname $0)/usb3.0-while-write-remove-device.sh
sleep 3
;;

120)
echo "120->122)********************hdd-write-RAM-to-HD*********************************"
$(dirname $0)/hdd-write-RAM-to-HD.sh
sleep 3
;;

123)
echo "123,128)**************hdd-write-read-stage1-folder-HD-RAM************************"
$(dirname $0)/hdd-write-read-stage1-folder-HD-RAM.sh
sleep 3
;;

124)
echo "124,129)**************hdd-write-read-stage5-folder-HD-RAM************************"
$(dirname $0)/hdd-write-read-stage5-folder-HD-RAM.sh
sleep 3
;;

125)
echo "125->127)*****************hdd-write-HD-to-RAM************************************"
$(dirname $0)/hdd-write-HD-to-RAM.sh
sleep 3
;;

130)
echo "130)*********************hdd-exceeds-capacity-write-HD***************************"
$(dirname $0)/hdd-exceeds-capacity-write-HD.sh
sleep 3
;;

131)
echo "131)*********************hdd-write-HDD-to-USB3.0*********************************"
$(dirname $0)/hdd-write-HDD-to-USB3.0.sh
sleep 3
;;

132)
echo "132)*********************hdd-write-USB3.0-to-HDD*********************************"
$(dirname $0)/hdd-write-USB3.0-to-HDD.sh
sleep 3
;;

133)
echo "133)*************************hdd-suspend-test************************************"
$(dirname $0)/hdd-suspend.sh
sleep 3
;;

134)
echo "134)*********************usb2.0-seek device test*********************************"
$(dirname $0)/usb2.0-seek-device.sh
sleep 3
;;

135)
echo "135)*********************usb2.0-check-sectors test*******************************"
$(dirname $0)/usb2.0-check-seek.sh
sleep 3
;;

136)
echo "136)*********************usb3.0-seek device test*********************************"
$(dirname $0)/usb3.0-seek-device.sh
sleep 3
;;

137)
echo "137)*********************usb3.0-check-sectors test*******************************"
$(dirname $0)/usb3.0-check-seek.sh
sleep 3
;;

138)
echo "138)*********************smp-multiple-cpu-USB3.0*********************************"
$(dirname $0)/smp-test-multi-cpu-USB3.0.sh
sleep 3
;;

139)
echo "139)*********************smp-multiple-cpu-USB2.0*********************************"
$(dirname $0)/smp-test-multi-cpu-USB2.0.sh
sleep 3
;;

140)
echo "140)******************smp-multiple-cpu-USB2.0-USB3.0*****************************"
$(dirname $0)/smp-test-multi-cpu-USB2.0-USB3.0.sh
sleep 3
;;

141)
echo "141)***************************stress-cpu-USB2.0*********************************"
$(dirname $0)/stress-cpu-USB2.0.sh
sleep 3
;;

142)
echo "142)***************************stress-cpu-USB3.0*********************************"
$(dirname $0)/stress-cpu-USB3.0.sh
sleep 3
;;

esac