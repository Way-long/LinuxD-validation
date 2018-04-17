#!/bin/sh

set -e
#set -x

echo "sh-sci /proc/interrupts presence test"

sshpass -p $PASSWD_BOARD ssh -o StrictHostKeyChecking=no root@$IP_BOARD <<ENDSSH

exec  $SHELL_SOURCE_CODE/common/proc-interrupts.sh "$SCIF_INTERRUPT_01"

ENDSSH
