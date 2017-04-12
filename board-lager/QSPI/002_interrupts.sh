#!/bin/sh
echo "check interrupt"

cat /proc/interrupts | grep e6b10000 && echo "\nPASSED" || echo "\nFAILED"
