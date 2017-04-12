#!/bin/bash

echo "copy file 5 level folder from SD1 to SD0"

$(dirname $0)/../helper/write_folder_helper.sh "sd1" -src "sd0" -read -flvl 5