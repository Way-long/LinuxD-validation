#!/bin/bash
echo "checking device ADV7511 address"

ls /sys/bus/i2c/devices | grep "0039" && echo -e "\nPASSED" || echo -e "\nFAILED"


