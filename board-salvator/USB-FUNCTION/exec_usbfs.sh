#!/bin/sh
# usb function device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/config_usbfs.sh

SHELL_SCRIPT_FILE="$1"
ONLY_RUN_FROM_PC="$2"

echo -e "\n ${BEGIN_TIMER} \n"

# check source code run from HOST PC
if pwd | grep "tftpboot" > /dev/null ;then 

if [ "$ONLY_RUN_FROM_PC" = "1" ];then
	
	$(dirname $0)/$SHELL_SCRIPT_FILE

else	

$CMD_SSH <<ENDSSH
	
	exec $SHELL_SOURCE_CODE/$DRIVER_PATH/exec_usbfs.sh $SHELL_SCRIPT_FILE

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