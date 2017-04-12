#!/bin/bash

echo "copy file 5 level folder from SD0 to SD1"

$(dirname $0)/../helper/write_folder_helper.sh "sd1" -src "sd0" -flvl 5