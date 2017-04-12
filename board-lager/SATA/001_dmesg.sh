#!/bin/sh

set -e
#set -x

echo "checking by dmesg"

dmesg | grep -i sata | grep 'link up' && echo "\nPASSED" || echo "\nFAILED"
