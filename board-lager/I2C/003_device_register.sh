#!/bin/bash
echo "checking device registration"

ls /sys/bus/platform/drivers | grep "i2c-rcar" && echo -e "\nPASSED" || echo -e "\nFAILED"
	
