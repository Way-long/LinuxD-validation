#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n***********************CHANGE COLOR ON ${RGB_NAME}**********************\n"

$(dirname $0)/du_change_color.sh $RGB_NAME

echo "\n************************************************************************\n"