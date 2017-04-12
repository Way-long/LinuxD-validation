#!/bin/bash
echo "Driver info"

if ethtool -i eth0 | grep -i "support" | grep -i  "statistic" | grep -i "yes";then
	echo -e "\nPASSED"
else
	echo -e "\nFAILED"
fi