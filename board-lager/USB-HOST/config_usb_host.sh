#!/bin/sh

# config file shell script
USB_1_1="ohci_hcd"
USB_2_0="ehci_hcd"
USB_3_0="xhci_hcd"

#tmp file
LOG_FILE="/tmp/storage.txt"
RAM_DIR="/tmp/temp"
USB_DIR="/mnt/usb2"
USB3_DIR="/mnt/usb3"
HDD_DIR="/mnt/hd0"

DEVICE_USB="/dev/sda"
DEVICE_USB3="/dev/sdb"
SOURCE="/dev/urandom"
UNIT="mb"
CPU_NUMBER=4					   # number of cpu	
USB_NAME="usb2.0"
USB3_NAME="usb3.0"
RAM_NAME="ram"
SD_NAME0="hd0"
SIZE_FILE_LOG="/tmp/size.txt"
DRIVER="sh_mobile_sdhi"