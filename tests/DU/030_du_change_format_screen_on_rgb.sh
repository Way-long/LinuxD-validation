#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n*******************CHANGE FORMAT SCREEN ${RGB_NAME}*******************\n"

$(dirname $0)/du_change_format_screen.sh $RGB_NAME

echo "\n************************************************************************\n"