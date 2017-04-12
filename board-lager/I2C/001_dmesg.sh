#!/bin/bash
echo "checking by dmesg"

dmesg | grep e6530000 | grep -i "probed" && echo -e "\nPASSED" || echo -e "\nFAILED"
	