
echo "checking I2C interrupt"

cat /proc/interrupts | grep e6530000 && echo -e "\nPASSED" || echo -e "\nFAILED"