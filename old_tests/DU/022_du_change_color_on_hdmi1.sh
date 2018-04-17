#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n***********************CHANGE COLOR ON ${HDMI_NAME1}********************\n"

$(dirname $0)/du_change_color.sh $HDMI_NAME1

echo "\n************************************************************************\n"