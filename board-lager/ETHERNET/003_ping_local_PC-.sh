#!/bin/sh

host_ip=`$(dirname $0)/../common/get_ip.sh`
on_board_path=`$(dirname $0)/../common/path_helper.sh`

ssh $SSH_AUTHEN "$on_board_path/../common/check_ping.sh $host_ip"
