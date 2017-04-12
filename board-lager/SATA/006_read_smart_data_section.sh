#!/bin/bash
echo "Test read smart data section"

smartctl -d ata -H /dev/sda | grep "PASSED" && echo -e "PASSED" || echo -e "FAILED"
