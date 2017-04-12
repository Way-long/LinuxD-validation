#!/bin/bash
echo "stress test"

$(dirname $0)/../common/do_stress.sh 300s &
pid=$!

$(dirname $0)/tftp_eth.sh -timeout 300

if ps -p $pid > /dev/null;then
        echo "waiting $pid"
        wait $pid
fi