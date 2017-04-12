#!/bin/bash
echo "checking device ADV7612 address"

ls /sys/bus/i2c/devices | grep "004c" && echo -e "\nPASSED" || echo -e "\nFAILED"


