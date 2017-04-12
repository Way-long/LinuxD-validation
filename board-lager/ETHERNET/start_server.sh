#!/bin/bash

protocol=${1,,}
if [[ "$protocol" == "udp" ]]; then
	iperf -s -u &
else
	iperf -s &
fi
echo "$!"
