#!/bin/bash
echo "checking device none address"

ls /sys/bus/i2c/devices | grep "003f" && echo -e "\nPASSED" || echo -e "\nFAILED"


