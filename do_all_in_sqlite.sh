#!/bin/env sh
echo .import --csv -v trades.csv trades | sqlite3 tmp.db
sqlite3 tmp.db 'update trades SET "Average Price" = replace("Average Price", ",","");' 
sqlite3 tmp.db -column 'Select Date, Symbol, Quantity, "Average Price", Fees  from trades where "Instrument Type" = "Equity" and Type = "Trade" order by Symbol asc, Date asc;'
sqlite3 tmp.db -column 'Select max(Date), Symbol, sum(Quantity), sum(Fees), sum(Quantity * "Average Price")  from trades where "Instrument Type" = "Equity" and Type = "Trade" group by symbol order by Symbol asc, Date asc;'

#rm tmp.db 
