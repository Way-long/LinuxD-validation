#!/bin/sh
# display unit device driver autotest shell-script

set -a
#set -x

$(dirname $0)/exec_du.sh 001_du_check_dmesg.sh
sleep 3


$(dirname $0)/exec_du.sh 002_du_check_interrupt.sh
sleep 3


$(dirname $0)/exec_du.sh 005_du_ram_display_image_on_rgb.sh
sleep 3


$(dirname $0)/exec_du.sh 008_du_sd1_display_image_on_rgb.sh
sleep 3


$(dirname $0)/exec_du.sh 011_du_sd2_display_image_on_rgb.sh
sleep 3

$(dirname $0)/exec_du.sh 014_du_counter_interupt_on_rgb.sh
sleep 3


$(dirname $0)/exec_du.sh 017_du_display_image_on_rgb_after_suspend.sh 1
sleep 3


$(dirname $0)/exec_du.sh 020_du_change_resolution_on_rgb.sh
sleep 3


$(dirname $0)/exec_du.sh 023_du_change_color_on_rgb.sh
sleep 3


$(dirname $0)/exec_du.sh 024_du_check_drm.sh
sleep 3


$(dirname $0)/exec_du.sh 027_switch_rgb_to_du3.sh
sleep 3


$(dirname $0)/exec_du.sh 030_du_change_format_screen_on_rgb.sh
sleep 3


$(dirname $0)/exec_du.sh 033_du_change_resolution_from_rgb_to_du3.sh
sleep 3


$(dirname $0)/exec_du.sh 036_du_change_offset_on_rgb.sh
sleep 3


$(dirname $0)/exec_du.sh 039_du_change_layer_position_from_rgb_to_du3.sh
sleep 3
