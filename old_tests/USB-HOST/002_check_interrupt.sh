#!/bin/sh
# usb device driver autotest shell-script

set -e
#set -x

echo "\n*********************CHECK INTERRUPT AFTER START THE BOARD**************\n"

exec $(dirname $0)/../common/proc-interrupts-multiple.sh "ehci_hcd:usb1" "ohci_hcd:usb3" "ehci_hcd:usb2" "ohci_hcd:usb4"

echo "\n************************************************************************\n"
