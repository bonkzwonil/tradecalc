#!/bin/env sh
export LC_ALL=en_US
./convert.sh | awk -f calc.awk | grep -v \#\# | column -t 
