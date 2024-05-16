#!/bin/env sh
export LC_ALL=C
export LANG=en_US
./convert.sh | awk -f calc.awk | grep -v \#\# | column -t 
