#!/bin/bash
# run this file on host-pc while running unix bench on board

echo "for unix bench test...."


running="true"
while [[ "$running" == "true" ]]; do
	iperf -c 172.16.1.120 -u -b 10M
done

