#!/bin/sh
# timer device driver autotest shell-script

set -e
#set -x

echo "\n************************CHECK DMESG AFTER START THE BOARD***************\n"

$(dirname $0)/../common/dmesg-multiple.sh "cp15 timer(s) running at"

echo "\n************************************************************************\n"
