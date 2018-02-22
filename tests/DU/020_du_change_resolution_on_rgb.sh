#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n**********************CHANGE RESOLUTION ${RGB_NAME}*********************\n"

$(dirname $0)/du_display_image.sh $RGB_NAME

echo "\n************************************************************************\n"