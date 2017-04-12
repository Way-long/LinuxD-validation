#!/bin/bash

echo "check after suspending"

$(dirname $0)/../common/suspend_resume.sh

on_board_path=`$(dirname $0)/../common/path_helper.sh`
ssh $SSH_AUTHEN "$on_board_path/../common/check_ping.sh"


