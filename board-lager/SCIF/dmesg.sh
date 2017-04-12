#!/bin/sh

set -e
#set -x

echo "sh-sci dmesg feature test"

$(dirname $0)/../common/dmesg-multiple.sh "$SCIF_INTERRUPT_01: .*is a scif" "$SCIF_INTERRUPT_02: .*is a scif"
