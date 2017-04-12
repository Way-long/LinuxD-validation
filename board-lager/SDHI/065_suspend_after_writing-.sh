#!/bin/bash
echo "suspend after writing SD card"

$(dirname $0)/../helper/suspend_helper-.sh "/mnt/sd"
