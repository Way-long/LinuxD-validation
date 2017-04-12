#!/bin/bash
echo "Test read smart data section"

smartctl -d ata -a /dev/sda | grep "SMART support is: Enabled" && echo -e "PASSED" || echo -e "FAILED"