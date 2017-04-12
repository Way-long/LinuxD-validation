#!/bin/bash

echo "copy file 5 level folder from RAM to SD0 which already have data inside"

$(dirname $0)/../helper/write_folder_helper.sh "/mnt/sd0" -flvl 5 -hasdata