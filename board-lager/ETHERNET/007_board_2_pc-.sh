#!/bin/sh

echo "transfer data from board to pc with iperl"

host_ip=`$(dirname $0)/../common/get_ip.sh`
# ====================================
echo "<-----------------UDP TEST-------------->"
# start server
iperf -s -u > /dev/null 2>&1 &
udp=$!
# test client
for b in "1M" "10M" "50M" "100M" "500M" "1000M"; do
# for b in "1M" "10M"; do
	output=`ssh $SSH_AUTHEN "iperf -c $host_ip -u -b $b 2>&1"`
	echo  "\nTest with bandwith of $b:"
	echo  "$output"
done

# stop server
kill -9 $udp > /dev/null 2>&1 

# wait awhile for the port get released
sleep 2

echo  "\n\n<-----------------TCP TEST-------------->"
# start server
iperf -s > /dev/null  &
tcp=$!
# test client
output=`ssh $SSH_AUTHEN "iperf -c $host_ip 2>&1"`
echo  "$output"
# stop server
kill -9 $tcp