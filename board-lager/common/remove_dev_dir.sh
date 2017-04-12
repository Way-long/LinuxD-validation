#!/bin/sh

set -e
#set -x
cmd="$(dirname $0)/cmd.sh"

DEV_DIR="$1"

# Umount device
$cmd "umount ${DEV_DIR}"

# Umount check
if [ $? -eq 0 ];then
	$cmd "rm -r '$DEV_DIR'"
	if [ -d "$DIR" ]; then
		echo "cannot remove directory $DIR"
		exit 1
	fi
	exit 0
else
	echo "error happen while umounting device $DEV_DIR" >&2
	exit 1
fi
