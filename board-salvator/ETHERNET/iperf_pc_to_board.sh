#!/bin/sh
# ethernet device driver autotest shell-script

set -e
#set -x

. $(dirname $0)/config_ether.sh
. $(dirname $0)/../config.sh

echo "UDP check tranfers rate"

for bw in "1" "10" "50" "100" "500" "1000" "2000"; do

	iperf -c $IPBOARD -u -b ${bw}M >> $LOGFILE 

	if cat $LOGFILE | grep "read failed: Connection refused" ;then

		echo "\n {TEST FAILED} \n"
		rm -rf $LOGFILE
		exit 1
	fi	

done

rm -rf $LOGFILE
echo "\n {TEST PASSED} \n"
