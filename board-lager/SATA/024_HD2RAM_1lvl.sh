#!/bin/bash

echo "copy file 1 level folder from SATA device to RAM"

$(dirname $0)/../helper/write_folder_helper.sh "/mnt/hd" -read