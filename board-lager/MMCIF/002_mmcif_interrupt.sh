
echo "checking MMCIF interrupt"

cat /proc/interrupts | grep mmc && echo -e "\nPASSED" || echo -e "\nFAILED"