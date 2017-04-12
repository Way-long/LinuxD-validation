#!/bin/bash
echo "checking by dmesg"

dmesg | grep sh_mmcif && echo -e "\nPASSED" || echo -e "\nFAILED"
