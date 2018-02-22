#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n*******************RAM DISPLAY IMAGE ON ${HDMI_NAME0}*******************\n"

$(dirname $0)/du_display_image.sh $HDMI_NAME0 $RAM_DIR

echo "\n************************************************************************\n"