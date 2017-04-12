#!/bin/bash

echo "transfer data from pc to board with iperl"

# ====================================
echo "<-----------------UDP TEST-------------->"
# start server
{
	ssh $SSH_AUTHEN "iperf -s -u"
} > /dev/null &

# test client
sleep 3
for b in "1M" "10M" "50M" "100M" "500M" "1000M"; do
# for b in "1M" "10M"; do
	output=`iperf -c $IP_BOARD -u -b $b 2>&1`
	echo -e "\nTest with bandwith of $b:"
	echo -e "$output"
done

# stop server
server=`ssh $SSH_AUTHEN "ps -aux | grep -E '[0-9 ]+iperf -s' | grep -o -E '[0-9]+' | head -1"`
ssh $SSH_AUTHEN "kill $server"


# wait awhile for the port get released
sleep 2

echo -e "\n\n<-----------------TCP TEST-------------->"
# start server
{
	ssh $SSH_AUTHEN "iperf -s"
} > /dev/null &
# test client
sleep 3
output=`iperf -c $IP_BOARD 2>&1`
echo -e "$output"
# stop server
server=`ssh $SSH_AUTHEN "ps -aux | grep -E '[0-9 ]+iperf -s' | grep -o -E '[0-9]+' | head -1"`
ssh $SSH_AUTHEN "kill $server"