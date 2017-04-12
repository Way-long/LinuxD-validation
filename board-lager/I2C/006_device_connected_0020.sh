#!/bin/bash
echo "checking device ADV7180 address"

ls /sys/bus/i2c/devices | grep "0020" && echo -e "\nPASSED" || echo -e "\nFAILED"


