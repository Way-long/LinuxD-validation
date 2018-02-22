#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n*******************SD1 DISPLAY IMAGE ON ${HDMI_NAME0}*******************\n"

$(dirname $0)/du_display_image.sh $HDMI_NAME0 $SD1_DIR

echo "\n************************************************************************\n"