#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n*******************CHANGE FORMAT SCREEN ${HDMI_NAME1}*******************\n"

$(dirname $0)/du_change_format_screen.sh $HDMI_NAME1

echo "\n************************************************************************\n"