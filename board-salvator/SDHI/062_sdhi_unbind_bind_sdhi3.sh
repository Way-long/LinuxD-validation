#!/bin/sh
# sdhi device driver autotest shell-script

set -a
#set -x

echo "\n*********************UNBIND BIND SDHI TEST*********************\n"

$(dirname $0)/sdhi_unbind_rebind_sdx.sh $SD2_DIR

echo "\n***************************************************************\n"