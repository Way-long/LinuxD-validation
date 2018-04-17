#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n****************CHECK INTERRUPT COUNTER ON ${HDMI_NAME0}****************\n"

$(dirname $0)/du_counter_interupt.sh $HDMI_NAME0

echo "\n************************************************************************\n"