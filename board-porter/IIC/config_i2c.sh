#!/bin/sh
# i2c device driver autotest shell-script

. $(dirname $0)/../config.sh

DRIVER="i2c-rcar"
DRIVER_PATH="IIC"

#i2c interrupt
I2C_INTERRUPT_1="e6510000.i2c"
I2C_INTERRUPT_2="e66d8000.i2c"

#device i2c use
AK4643_NAME="ak4613"
AK4643_DEVICE="2-0010"
CS2000_NAME="cs2000-cp"
CS2000_DEVICE="2-004f"

#device node
I2C_DEVICE_1="/dev/i2c-2"
I2C_DEVICE_2="/dev/i2c-4"

LOG_FILE="i2c.txt"