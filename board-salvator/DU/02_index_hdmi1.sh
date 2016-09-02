#!/bin/sh
# display unit device driver autotest shell-script

set -a
#set -x

$(dirname $0)/exec_du.sh 001_du_check_dmesg.sh
sleep 3


$(dirname $0)/exec_du.sh 002_du_check_interrupt.sh
sleep 3


$(dirname $0)/exec_du.sh 004_du_ram_display_image_on_hdmi1.sh
sleep 3


$(dirname $0)/exec_du.sh 007_du_sd1_display_image_on_hdmi1.sh
sleep 3


$(dirname $0)/exec_du.sh 010_du_sd2_display_image_on_hdmi1.sh
sleep 3


$(dirname $0)/exec_du.sh 013_du_counter_interupt_on_hdmi1.sh
sleep 3


$(dirname $0)/exec_du.sh 016_du_display_image_on_hdmi1_after_suspend.sh 1
sleep 3


$(dirname $0)/exec_du.sh 019_du_change_resolution_on_hdmi1.sh
sleep 3


$(dirname $0)/exec_du.sh 022_du_change_color_on_hdmi1.sh
sleep 3


$(dirname $0)/exec_du.sh 024_du_check_drm.sh
sleep 3


$(dirname $0)/exec_du.sh 026_du_switch_hdmi1_to_du2.sh
sleep 3


$(dirname $0)/exec_du.sh 029_du_change_format_screen_on_hdmi1.sh
sleep 3


$(dirname $0)/exec_du.sh 032_du_change_resolution_from_hdmi1_to_du2.sh
sleep 3


$(dirname $0)/exec_du.sh 035_du_change_offset_on_hdmi1.sh
sleep 3


$(dirname $0)/exec_du.sh 038_du_change_layer_position_from_hdmi1_to_du2.sh
sleep 3