#!/bin/sh
# usb host device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/config_usb_host.sh

SHELL_SCRIPT_FILE="$1"
ONLY_RUN_FROM_PC="$2"

echo -e "\n ${BEGIN_TIMER} \n"

NUMBER=`echo "$SHELL_SCRIPT_FILE" | cut -f1 -d"_"`
echo "$NUMBER)"

# check source code run from HOST PC
if pwd | grep "tftpboot" > /dev/null ;then 

if [ "$ONLY_RUN_FROM_PC" = "1" ];then
	
	$(dirname $0)/$SHELL_SCRIPT_FILE

else	

$CMD_SSH <<ENDSSH
	
	exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_usb.sh $SHELL_SCRIPT_FILE

ENDSSH

fi

# check source code run from board
else
	if [ "$ONLY_RUN_FROM_PC" = "1" ];then
		echo "this item test only run from HOST PC via SSH. Please check again"
	else
		$(dirname $0)/$SHELL_SCRIPT_FILE
	fi
fi

echo -e "\n ${END_TIMER} \n"