#!/bin/bash

echo "copy file 1 level folder from SD0 to RAM"

$(dirname $0)/../helper/write_folder_helper.sh "/mnt/sd0" -read