#!/bin/bash
source "$(dirname $0)/../config.sh"

action=$1
# action="get"
blkcnt=150

host_ip=`$(dirname $0)/../common/get_ip.sh`
on_board_path=`$(dirname $0)/../common/path_helper.sh`
pcF=$(mktemp -p /tmp/)
boardF=`ssh $SSH_AUTHEN "mktemp -p /tmp/"`

if [[ "$action" == "put" ]]; then
	cmd="put $boardF $pcF"
	ssh $SSH_AUTHEN "$on_board_path/../common/create_random_file.sh $boardF -bcnt $blkcnt"
else
	cmd="get $pcF $boardF"
	$(dirname $0)/../common/create_random_file.sh $pcF -bcnt $blkcnt
fi

RET=0
logF="/tmp/log.txt"
echo "[$$]> start ftp transaction"
ssh $SSH_AUTHEN "set -m ; $on_board_path/ftp_access.sh '$cmd' -h $host_ip -u $FTP_USER -p $FTP_PW" > "$logF" &
pid=$!
sleep 4
echo "[$$]> pause process"
log=`ssh $SSH_AUTHEN "pgrep -x 'ftp' | xargs --no-run-if-empty ps fp | grep 'ftp -n -v'"`
intPID=`echo "$log" | awk '{print $1}'`
if [[ "$intPID" ]] ;then
	ssh $SSH_AUTHEN "kill -TSTP $intPID" || echo "ERROR: pause failed (pid = $intPID)"
	sleep 3
	pstat=`ssh $SSH_AUTHEN "ps -up $intPID | grep $intPID"`
	pstat=`echo "$pstat" | awk '{print $8}'`

	[[ "$pstat" == "T"* ]] && echo "process paused (state = $pstat)" || { RET=1; echo "ERROR: process state is $pstat"; }

	if [[ "$action" == "put" ]]; then
		fsize=`$(dirname $0)/../common/size_of.sh "$pcF"`
		sleep 5
		fsize1=`$(dirname $0)/../common/size_of.sh "$pcF"`
	else
		fsize=`ssh $SSH_AUTHEN "$on_board_path/../common/size_of.sh $boardF"`
		sleep 5
		fsize1=`ssh $SSH_AUTHEN "$on_board_path/../common/size_of.sh $boardF"`
	fi
	echo "file size at paused time: $fsize"
	echo "file size after 5 seconds from paused time: $fsize1"
	[[ "$fsize" != "$fsize1" ]] && RET=2

	echo "[$$]> resume process"
	ssh $SSH_AUTHEN "kill -CONT $intPID" || echo "ERROR: restart failed (pid = $intPID)"
else
	RET=3
	echo "ERROR: no ftp process found"
fi
wait $pid || echo "ERROR: error code returned ($?)"

[[ "$action" == "put" ]] && fsize2=`$(dirname $0)/../common/size_of.sh "$pcF"` || fsize2=`ssh $SSH_AUTHEN "$on_board_path/../common/size_of.sh $boardF"`
echo "size of the created file: $fsize2"

ssh $SSH_AUTHEN "cat $boardF" | diff - "$pcF" || RET=4
[[ "$RET" == 0 ]] && echo -e "\nPASSED"
# cat $logF

# clean up
rm $logF
rm $pcF
ssh $SSH_AUTHEN "rm $boardF"

exit $RET