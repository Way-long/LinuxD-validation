#!/bin/sh
# display unit device driver autotest shell-script

set -a
#set -x

echo "Please connect cable to port HDMI0 before test this task"

sleep 5

for i in "1" "2" "3" "6" "9" "12" "15" "18" "21" "24" "25" "28" "31" "34" "37"; do

	$(dirname $0)/_index.sh $i
	sleep 3

done