#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n**********************CHANGE RESOLUTION ${HDMI_NAME0}*******************\n"

$(dirname $0)/du_change_resolution.sh $HDMI_NAME0

echo "\n************************************************************************\n"