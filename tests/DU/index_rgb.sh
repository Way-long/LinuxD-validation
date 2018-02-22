#!/bin/sh
# display unit device driver autotest shell-script

set -a
#set -x

#!/bin/sh
# display unit device driver autotest shell-script

set -a
#set -x

echo "Please connect cable to port RGB before test this task"

sleep 5

for i in "1" "2" "5" "8" "11" "14" "17" "20" "23" "24" "27" "30" "33" "36" "39"; do

	$(dirname $0)/_index.sh $i
	sleep 3

done