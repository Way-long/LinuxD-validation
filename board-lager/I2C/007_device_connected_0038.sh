#!/bin/bash
echo "checking device none address"

ls /sys/bus/i2c/devices | grep "0038" && echo -e "\nPASSED" || echo -e "\nFAILED"


