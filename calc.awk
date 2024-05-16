BEGIN { symbol = 0; pnl=0;}
{ 
 sym = $3;
 v = $4 * $5;
 amount = v<0 ? 1 : -1;
 amount *= $4;
 at = $1;
 fees = $6;
  if (sym == symbol ) { 
	  spnl += v+fees; 
	  i++; 
	  open+=amount; 
	  print "### " sym "->" v "  " amount,$5;
	  if ( open == 0 && symbol!=0 ) { 
		  print symbol,spnl,at,i; #symbol, p&l, closedAt, #of trades  
		  pnl += spnl;
		  spnl = 0;
	  }
  } 
  else {  
	  print "### " sym "->" v "  " amount,$5; 
  	  if(open!=0) { print "# STILL OPEN: ",symbol,open,"" > "/dev/stderr" }
  	  spnl=v ; 
	  symbol = sym; 
	  i=1;
	  open = amount; 
  }
}

END{print "----\nTotal", pnl,  "P&L" }

