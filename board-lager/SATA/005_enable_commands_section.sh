#!/bin/bash

echo "ENABLE commands section"

smartctl -s on -d ata /dev/sda | grep -i "SMART Enabled."  && echo -e "\nPASSED" || echo -e "\nFAILED"