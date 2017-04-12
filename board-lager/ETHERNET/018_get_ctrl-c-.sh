#!/bin/bash
echo "perform ctrl-c while getting file"

on_board_path=`$(dirname $0)/../common/path_helper.sh`
host_ip=`$(dirname $0)/../common/get_ip.sh`

pcF=$(mktemp -p /tmp/)
boardF=`ssh $SSH_AUTHEN "mktemp -p /tmp/"`
$(dirname $0)/../common/create_random_file.sh $pcF -bcnt 100

cmd="get $pcF $boardF"
ssh $SSH_AUTHEN "$on_board_path/ctrl-c.sh '$cmd' -h $host_ip -u $FTP_USER -p $FTP_PW"
code=$?
if [[ "$code" == "0" ]]; then
	if [[ -f "$pcF" ]]; then
		fsize1=`ssh $SSH_AUTHEN "$on_board_path/../common/size_of.sh $boardF"`
		echo "size of file on BOARD: $fsize1"
		fsize=`$(dirname $0)/../common/size_of.sh "$pcF"`
		echo "size of file created on PC: $fsize"
		[[ "$fsize" != "$fsize1" ]] && echo -e "\nPASSED"
	else
		echo "ERROR: file is not created on PC"
	fi
fi
# clean up
rm $pcF
ssh $SSH_AUTHEN "rm $boardF"