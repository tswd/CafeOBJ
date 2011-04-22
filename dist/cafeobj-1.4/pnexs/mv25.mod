** $Id: mv25.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** translated from OTTER-3.0.5 examples/mv25.in
** begin{quote}
--  The (infinitely) Many-Valued sentential calculus (MV).
--  
--  {MV-1,MV-2,MV-3,MV-5} axiomatizes MV.
--  
** end {quote}

module! MV (X :: TRIV)
{
  protecting (FOPL-CLAUSE)
  pred P : Elt
  op i : Elt Elt -> Elt 
  op n : Elt -> Elt
  vars x y z : Elt

  ax [condensed-datachment]: P(i(x,y)) & P(x) -> P(y).
  ax [mv-1]: P(i(x,i(y,x))).
  ax [mv-2]: P(i(i(x,y),i(i(y,z),i(x,z)))).
  ax [mv-3]: P(i(i(i(x,y),y),i(i(y,x),x))).
  ax [mv-5]: P(i(i(n(x),n(y)),i(y,x))).
}

option reset
flag(auto,on)
** DOES NOT WORK WITHOUT THE FOLLOWING TWO OPTIONS 
flag(control-memory,off)
param(max-weight,16)

open MV
ops a b c : -> Elt .
goal P(i(i(a,b),i(i(c,a),i(c,b)))).
resolve .
close
--
eof
