#!/bin/sh
# pciec device driver autotest shell-script

set -a
#set -x

. $(dirname $0)/../config.sh

# config driver pciec shell script
DRIVER="rcar-pcie"							# pciec driver name of renesas
PCIEC_INTERRUPT="fe000000.pcie"				# interrupt of pciec
INTERFACE="eth0"     						# interface of pciec on board
INTEL_PCI_DRIVER="e1000"					# intel pci driver name
INTEL_PCI_BUS_INFO="0000:01:00.0"			# intel pci bus info
DRIVER_PATH="PCIEC"							# path driver for run test		
GOOGLE="google.co.jp"						# google site link
LOGFILE="pciec_log.txt"						# log file name

# suport command
MOUNT_RAM="mount -t tmpfs -o size=400m tmpfs /tmp"
UNMOUNT_RAM="umount /tmp"

# seting ethernet for pciec
$(dirname $0)/setting_ethernet.sh > /dev/null