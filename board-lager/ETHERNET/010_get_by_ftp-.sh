#!/bin/bash
echo "transfer data from PC to BOARD with ftp"

on_board_path=`$(dirname $0)/../common/path_helper.sh`
host_ip=`$(dirname $0)/../common/get_ip.sh`

pcF=$(mktemp -p /tmp/)
boardF=`ssh $SSH_AUTHEN "mktemp -p /tmp/"`
$(dirname $0)/../common/create_random_file.sh $pcF -bcnt 100

cmd="get $pcF $boardF"
echo "[$$]> transfer data"
echo "> $cmd"
log=`ssh $SSH_AUTHEN "$on_board_path/ftp_access.sh '$cmd' -h $host_ip -u $FTP_USER -p $FTP_PW"`
# echo -e "$log"

if [[ -f "$pcF" ]]; then
	ssh $SSH_AUTHEN "cat $boardF" | diff - "$pcF" && echo -e "\nPASSED"
else
	echo "ERROR: file is not created on PC"
fi
# clean up
rm $pcF
ssh $SSH_AUTHEN "rm $boardF"


