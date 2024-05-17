#!/bin/env sh
./sort_and_summarize.sh <trades.csv | grep -v \#\# | grep $1 | LANG=en_US awk '{pnl+=$2} END{print "PnL:   " pnl}'
