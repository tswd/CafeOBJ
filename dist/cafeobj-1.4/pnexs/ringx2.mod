** $Id: ringx2.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** translated from OTTER 3.0.5 examples/ringx2.in
** begin{quote}
-- 
--   Boolean (xx = x) rings are commutative.
-- 
** end{quote}

module! RING (X :: TRIV)
{ 
  op 0 : -> Elt
  op j : Elt Elt -> Elt
  op g : Elt -> Elt
  op f : Elt Elt -> Elt
  vars x y z : Elt
  -- % Ring axioms
  eq j(0,x) = x .
  eq j(g(x),x) = 0 .
  eq j(j(x,y),z) = j(x,j(y,z)) .
  eq j(x,y) = j(y,x) .
  eq f(f(x,y),z) = f(x,f(y,z)).
  eq f(x,j(y,z)) = j(f(x,y),f(x,z)).
  eq f(j(y,z),x) = j(f(y,x),f(z,x)).
  eq f(x,x) = x .        --  Hypothesis
}

option reset
flag(auto,on)
flag(universal-symmetry,on)

open RING
protecting (FOPL-CLAUSE)
ops a b : -> Elt .
goal f(a,b) = f(b,a). 
resolve .
close
--
eof
