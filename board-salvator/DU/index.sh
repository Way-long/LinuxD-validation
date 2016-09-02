#!/bin/sh
# display unit device driver autotest shell-script

set -a
#set -x

case "$1" in

1)
$(dirname $0)/exec_du.sh 001_du_check_dmesg.sh
sleep 3
;;

2)
$(dirname $0)/exec_du.sh 002_du_check_interrupt.sh
sleep 3
;;

3)
$(dirname $0)/exec_du.sh 003_du_ram_display_image_on_hdmi0.sh
sleep 3
;;

4)
$(dirname $0)/exec_du.sh 004_du_ram_display_image_on_hdmi1.sh
sleep 3
;;

5)
$(dirname $0)/exec_du.sh 005_du_ram_display_image_on_rgb.sh
sleep 3
;;

6)
$(dirname $0)/exec_du.sh 006_du_sd1_display_image_on_hdmi0.sh
sleep 3
;;

7)
$(dirname $0)/exec_du.sh 007_du_sd1_display_image_on_hdmi1.sh
sleep 3
;;

8)
$(dirname $0)/exec_du.sh 008_du_sd1_display_image_on_rgb.sh
sleep 3
;;

9)
$(dirname $0)/exec_du.sh 009_du_sd2_display_image_on_hdmi0.sh
sleep 3
;;

10)
$(dirname $0)/exec_du.sh 010_du_sd2_display_image_on_hdmi1.sh
sleep 3
;;

11)
$(dirname $0)/exec_du.sh 011_du_sd2_display_image_on_rgb.sh
sleep 3
;;

12)
$(dirname $0)/exec_du.sh 012_du_counter_interupt_on_hdmi0.sh
sleep 3
;;

13)
$(dirname $0)/exec_du.sh 013_du_counter_interupt_on_hdmi1.sh
sleep 3
;;

14)
$(dirname $0)/exec_du.sh 014_du_counter_interupt_on_rgb.sh
sleep 3
;;

15)
$(dirname $0)/exec_du.sh 015_du_display_image_on_hdmi0_after_suspend.sh 1
sleep 3
;;

16)
$(dirname $0)/exec_du.sh 016_du_display_image_on_hdmi1_after_suspend.sh 1
sleep 3
;;

17)
$(dirname $0)/exec_du.sh 017_du_display_image_on_rgb_after_suspend.sh 1
sleep 3
;;

18)
$(dirname $0)/exec_du.sh 018_du_change_resolution_on_hdmi0.sh
sleep 3
;;

19)
$(dirname $0)/exec_du.sh 019_du_change_resolution_on_hdmi1.sh
sleep 3
;;

20)
$(dirname $0)/exec_du.sh 020_du_change_resolution_on_rgb.sh
sleep 3
;;

21)
$(dirname $0)/exec_du.sh 021_du_change_color_on_hdmi0.sh
sleep 3
;;

22)
$(dirname $0)/exec_du.sh 022_du_change_color_on_hdmi1.sh
sleep 3
;;


23)
$(dirname $0)/exec_du.sh 023_du_change_color_on_rgb.sh
sleep 3
;;


24)
$(dirname $0)/exec_du.sh 024_du_check_drm.sh
sleep 3
;;


25)
$(dirname $0)/exec_du.sh 025_du_switch_hdmi0_to_du1.sh
sleep 3
;;


26)
$(dirname $0)/exec_du.sh 026_du_switch_hdmi1_to_du2.sh
sleep 3
;;


27)
$(dirname $0)/exec_du.sh 027_switch_rgb_to_du3.sh
sleep 3
;;

28)
$(dirname $0)/exec_du.sh 028_du_change_format_screen_on_hdmi0.sh
sleep 3
;;

29)
$(dirname $0)/exec_du.sh 029_du_change_format_screen_on_hdmi1.sh
sleep 3
;;

30)
$(dirname $0)/exec_du.sh 030_du_change_format_screen_on_rgb.sh
sleep 3
;;

31)
$(dirname $0)/exec_du.sh 031_du_change_resolution_from_hdmi0_to_du1.sh
sleep 3
;;

32)
$(dirname $0)/exec_du.sh 032_du_change_resolution_from_hdmi1_to_du2.sh
sleep 3
;;

33)
$(dirname $0)/exec_du.sh 033_du_change_resolution_from_rgb_to_du3.sh
sleep 3
;;

34)
$(dirname $0)/exec_du.sh 034_du_change_offset_on_hdmi0.sh
sleep 3
;;

35)
$(dirname $0)/exec_du.sh 035_du_change_offset_on_hdmi1.sh
sleep 3
;;

36)
$(dirname $0)/exec_du.sh 036_du_change_offset_on_rgb.sh
sleep 3
;;


37)
$(dirname $0)/exec_du.sh 037_du_change_layer_position_from_hdmi0_to_du1.sh
sleep 3
;;

38)
$(dirname $0)/exec_du.sh 038_du_change_layer_position_from_hdmi1_to_du2.sh
;;

39)
$(dirname $0)/exec_du.sh 039_du_change_layer_position_from_rgb_to_du3.sh
sleep 3
;;

esac