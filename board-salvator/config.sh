#!/bin/sh

#**************************Change config below for each user ***********************
# config environment for test
IPBOARD="192.168.1.215"     				# ipaddress of board
IPSERVER="192.168.1.205"   					# ipaddress of host pc
GATEWAY="192.168.1.1"						# gateway internet
NETMASK="255.255.255.0"						# netmask internet
PCNAME="duclm"        					    # name of host pc 
PCPASSWORD="Jinso2016"      				# password of host pc
PC_FOLDER="/home/duclm/host_pc"			    # folder on host pc for test copy data
CPU_NUMBER=4					   			# number of cpu

# location shell script on board
SHELL_SOURCE_CODE="/home/SALVATOR_SHELL/board-salvator"

# ssh command
CMD_SSH="ssh root@$IPBOARD"

# suspend command					
PREPARE_SUSPEND="echo enabled > /sys/devices/platform/soc/e6e88000.serial/tty/ttySC0/power/wakeup"
CMD_SUSPEND="echo 'mem' > /sys/power/state"

#resume command
CMD_RESUME="echo 'resume' > /dev/ttyUSB0"

echo $PCPASSWORD | sudo chown ${PCNAME}:${PCNAME} /dev/ttyUSB0 > /dev/null 2>&1

#***********************************************************************************
# Please don't change config below. 

BEGIN_TIMER="`date` driver autotest START"
END_TIMER="`date` driver autotest END"
SOURCE="/dev/urandom"
UNIT="mb"

RAM_NAME="temp"								# name of ram
RAM_DIR="/tmp/${RAM_NAME}"					# directory for mount ram 

HDD_NAME="hd0"								# name of sata	
HDD_DIR="/mnt/hd0"							# directory for mount sata partition 1	
HDD_DIR1="/mnt/hd1"						    # directory for mount sata partition 2

SD1_NAME="sd1"								# name of sdhi 1
SD2_NAME="sd2"								# name of sdhi 2
SD1_DIR="/mnt/sd0"							# directory for mount sdhi 1
SD2_DIR="/mnt/sd1"							# directory for mount sdhi 2

USB2_NAME="usb2"							# name of usb 2.0 ch1
USB2_DIR="/mnt/usb2"						# directory for mount usb 2.0 ch1
USB2_CH2_NAME="usb2 ch2"					# name of usb 2.0 ch2
USB2_CH2_DIR="/mnt/usb2c2"					# directory for mount usb 2.0 ch2
USB3_NAME="usb3"							# name of usb 3.0
USB3_DIR="/mnt/usb3"						# directory for mount usb 3.0

# Color for print screen
COLOR_RED='\033[0;31m' 						# red color
COLOR_BLUE='\033[0;34m'						# blue color
COLOR_GREEN='\033[0;32m'					# green color
COLOR_YELLOW='\033[1;33m'					# yellow color
COLOR_NO='\033[0m' 							# No Color

# print message command
PASS_MEG="echo -e '\n${COLOR_GREEN}TEST PASSED${COLOR_NO}\n'"
FAIL_MEG="echo -e '\n${COLOR_RED}TEST FAILED${COLOR_NO}\n'"

#exit function