#!/bin/sh
echo "check dmesg"

dmesg | grep -i e6b10000 | grep -i "probed" && echo "\nPASSED" || echo "\nFAILED"
