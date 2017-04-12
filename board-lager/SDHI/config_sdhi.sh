#!/bin/sh

# config file shell script

#sata interrupt
SDHI_INTERRUPT_1="ee100000.sd"
SDHI_INTERRUPT_2="ee140000.sd"

#tmp file
LOG_FILE="/tmp/storage.txt"
RAM_DIR="/tmp/temp"
SD1_DIR="/mnt/sd1"
SD2_DIR="/mnt/sd2"
DEVICE_SD1="/dev/mmcblk1"
DEVICE_SD2="/dev/mmcblk2"
SOURCE="/dev/urandom"
UNIT="mb"
CPU_NUMBER=1					   # number of cpu	
SD1_NAME="sd1"
SD2_NAME="sd2"
RAM_NAME="ram"
SIZE_FILE_LOG="/tmp/size.txt"
DRIVER="sh_mobile_sdhi"