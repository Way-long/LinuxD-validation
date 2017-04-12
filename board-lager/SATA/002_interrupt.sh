#!/bin/sh

echo "checking by dmesg"

cat /proc/interrupts | grep sata && echo "\nPASSED" || echo "\nFAILED"
