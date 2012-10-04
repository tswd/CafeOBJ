** $Id: ec_yq.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** translated from OTTTER 3.05 example/auto/ec_yq.in
** begin{quote}
-- Equivalential calculus (EC): YQF -> YQL  (both are single axioms)
** end{quote}

module EC-YQ (E :: TRIV)
{
  protecting (FOPL-CLAUSE)
  pred P : Elt
  op e : Elt Elt -> Elt
  vars x y z : Elt
  ax P(e(x,y)) & P(x) -> P(y) .
  ax P(e(e(x,y),e(e(x,z),e(z,y)))) .
}

option reset
flag(auto,on)
open EC-YQ .
ops a b c : -> Elt .
goal P(e(e(a,b),e(e(c,b),e(a,c)))) .
resolve .
close
--
eof

