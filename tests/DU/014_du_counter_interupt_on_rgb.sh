#!/bin/sh
# display unit device driver autotest shell-script

set -e
#set -x

echo "\n****************CHECK INTERRUPT COUNTER ON ${RGB_NAME}******************\n"

$(dirname $0)/du_counter_interupt.sh $RGB_NAME

echo "\n************************************************************************\n"