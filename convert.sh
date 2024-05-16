#!/bin/env bash
mlr --c2p filter '$["Instrument Type"] == "Equity"' then cut -f "Symbol,Date,Average Price,Quantity,Fees,Type" \
       	|tail -n +2 \
	|grep Trade | sort -k3,3 -k1,1  -S "21%" \
	|sed s/,// #remove thousands seperators  
