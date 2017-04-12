#!/bin/bash
echo "checking device AK4643 address"

ls /sys/bus/i2c/devices | grep "0012" && echo -e "\nPASSED" || echo -e "\nFAILED"


