#!/bin/bash

echo "copy file 1 level folder from RAM to SD0 which already have data inside"

$(dirname $0)/../helper/write_folder_helper.sh "/mnt/sd0" -hasdata