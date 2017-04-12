#!/bin/sh

set -e
#set -x

echo "sh-sci /proc/interrupts presence test"

$(dirname $0)/../common/proc-interrupts.sh "$SCIF_INTERRUPT_01"

