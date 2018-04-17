#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

echo "UDP check tranfers rate"

for bw in "1" "10" "50" "100" "500" "1000" "2000"; do

	iperf -c $IPSERVER -u -b ${bw}M >> $LOGFILE

	if cat $LOGFILE | grep "read failed: Connection refused" ;then

		eval $FAIL_MEG
		rm -rf $LOGFILE
		exit 1
	fi	

done

rm -rf $LOGFILE
eval $PASS_MEG

