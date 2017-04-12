#!/bin/bash

echo "SATA hard disk speed cache"

log=`hdparm -tT /dev/sda`


echo -e "\n"
echo -e "$log" | grep "Timing cached reads" \
| grep -E "[1-9][0-9].[.]{0,1}[0-9].[ \t]*MB/sec" && echo -e "PASSED" || echo -e "FAILED"

echo -e "\n"
echo -e "$log" | grep "Timing buffered disk reads"  \
| grep -E "[1-9][0-9].[.]{0,1}[0-9].[ \t]*MB/sec" && echo -e "PASSED" || echo -e "FAILED"