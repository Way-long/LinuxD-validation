#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n*******************CHANGE OFFSET ON ${HDMI_NAME1}***********************\n"

$(dirname $0)/du_change_offset_screen.sh $HDMI_NAME1

echo "\n************************************************************************\n"