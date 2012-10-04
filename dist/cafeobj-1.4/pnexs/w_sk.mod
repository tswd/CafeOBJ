** $Id: w_sk.mod,v 1.1.1.1 2003-06-19 08:30:08 sawada Exp $
** translated from Otter 3.0.5 examples/auto/w_sk.in
-- Combinatory Logic
--  Construct W in terms of S and K, s.t.  Wxy = xyy.
**

module WSK
{
  [ E ]
  op __ : E E -> E { l-assoc }
  ops S K : -> E
  vars x y z : E
  eq S x y z = (x  z) (y z).
  eq K x y = x .
}

open WSK .
protecting (FOPL-CLAUSE) .
option reset .
flag (auto3,on) .
flag(print-new-demod,on) .
flag (universal-symmetry,on) .
goal \E[W:E]\A[x,y] W x y = x y y .
resolve .
--
close .
--
eof .


