#!/bin/sh
# gpio device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../config.sh

DRIVER="gpio_rcar"

#GPIO INTTERRUPT ARRAY
GPIO_INTERRUPT="e6055800.gpio e6055400.gpio e6055000.gpio e6054000.gpio e6053000.gpio e6052000.gpio e6051000.gpio e6050000.gpio"

#-------------------------------------------------------
#rcar H3

#GPIOCHIP ARRAY
GPIOCHIP="357 361 393 419 437 453 468 496"

#NGPIO ARRAY
NGPIO="4 32 26 18 16 15 28 16"

GPIO_INTERRUPT_SD1="ee100000.sd"
GPIO_INTERRUPT_SD2="ee140000.sd"

DRIVER_PATH="GPIO"
LIB_GPIO="gpiolib"
LEFT_BOUNDARY_PORT="357"
RIGHT_BOUNDARY_PORT="511"
LOGFILE="gpio.txt"

GPIO_PORT_1="398"
GPIO_PORT_2="399"

#------------------------------------------------------
#rcar M3
#GPIOCHIP ARRAY
# GPIOCHIP="356 360 392 418 436 452 467 496"

# #NGPIO ARRAY
# NGPIO="4 32 26 18 16 15 29 16"

# GPIO_INTERRUPT_SD1="ee100000.sd"
# GPIO_INTERRUPT_SD2="ee140000.sd"

# DRIVER_PATH="GPIO"
# LIB_GPIO="gpiolib"
# LEFT_BOUNDARY_PORT="357"
# RIGHT_BOUNDARY_PORT="511"
# LOGFILE="gpio.txt"

# GPIO_PORT_1="397"
# GPIO_PORT_2="398"