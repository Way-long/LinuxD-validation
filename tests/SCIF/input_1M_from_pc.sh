#!/bin/bash

set -e
#set -x

sleep 2

cat ./tests/SCIF/file_1mb.dat > $PC_PORT1
