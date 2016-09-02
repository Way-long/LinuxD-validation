#!/bin/sh
# display unit device driver autotest shell-script

set -a
#set -x

$(dirname $0)/exec_du.sh 001_du_check_dmesg.sh
sleep 3


$(dirname $0)/exec_du.sh 002_du_check_interrupt.sh
sleep 3


$(dirname $0)/exec_du.sh 003_du_ram_display_image_on_hdmi0.sh
sleep 3


$(dirname $0)/exec_du.sh 006_du_sd1_display_image_on_hdmi0.sh
sleep 3


$(dirname $0)/exec_du.sh 009_du_sd2_display_image_on_hdmi0.sh
sleep 3


$(dirname $0)/exec_du.sh 012_du_counter_interupt_on_hdmi0.sh
sleep 3


$(dirname $0)/exec_du.sh 015_du_display_image_on_hdmi0_after_suspend.sh 1
sleep 3


$(dirname $0)/exec_du.sh 018_du_change_resolution_on_hdmi0.sh
sleep 3


$(dirname $0)/exec_du.sh 021_du_change_color_on_hdmi0.sh
sleep 3


$(dirname $0)/exec_du.sh 024_du_check_drm.sh
sleep 3


$(dirname $0)/exec_du.sh 025_du_switch_hdmi0_to_du1.sh
sleep 3


$(dirname $0)/exec_du.sh 028_du_change_format_screen_on_hdmi0.sh
sleep 3


$(dirname $0)/exec_du.sh 031_du_change_resolution_from_hdmi0_to_du1.sh
sleep 3


$(dirname $0)/exec_du.sh 034_du_change_offset_on_hdmi0.sh
sleep 3


$(dirname $0)/exec_du.sh 037_du_change_layer_position_from_hdmi0_to_du1.sh
sleep 3
