#!/bin/sh
# display unit device driver autotest shell-script

set -a
#set -x

echo "Please connect cable to port HDMI1 before test this task"

sleep 5

for i in "1" "2" "4" "7" "10" "13" "16" "19" "22" "24" "26" "29" "32" "35" "38"; do

	$(dirname $0)/_index.sh $i
	sleep 3

done