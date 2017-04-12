#!/bin/sh

# config file shell script

QSPI_INTERRUPT="e6b10000.spi"	   # device driver to grep	


DRIVER="renesas_spi"			   # name driver to grep
QSPI_MOUNT_DIR="/mnt/qspi"         # folder mounted by qspi
RAM_MOUNT_DIR="/tmp/temp"		   # folder mounted by ram
BLOCK_DEV="/dev/mtdblock2"         
SOURCE="/dev/urandom"
UNIT="mb"