#!/bin/sh
# display unit device driver autotest shell-script

# config file shell script
. $(dirname $0)/../config.sh

#dma interrupt
DRIVER="rcar-du"							# display unit driver name of renesas
DU_INTERRUPT="feb00000.display"				# display unit driver interrupt

FILE_IMAGE="image.bmp"						# image file test

HDMI_NAME0="HDMI0"
HDMI_NAME1="HDMI1"
RGB_NAME="RGB"

DRIVER_PATH="DU"							# path driver for run test	
LOG_DRM="du_log.txt"						# log file name
LOGFILE="du.txt"

SDHI_INTERRUPT_0="ee100000.sd"				# interrupt of sdhi 1
SDHI_INTERRUPT_1="ee160000.sd"				# interrupt of sdhi 2

# command support for reset screen 
RESET_COMMAND="fbset -xres 800 -yres 600 -laced 0;fbset -xres 640 -yres 480 -laced 0"

# sdhi device for connected
DEVICE_DU="/dev/fb0"

