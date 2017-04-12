#!/bin/bash
echo "SATA hard disk speed"

hdparm -I /dev/sda | grep -i speed  && echo -e "\nPASSED" || echo -e "\nFAILED"