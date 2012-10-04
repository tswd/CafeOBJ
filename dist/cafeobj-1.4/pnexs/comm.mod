** $Id: comm.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** translated from OTTER3.05 example/auto/comm.in
** begin{quote}
-- The group theory commutator problem.
-- If xxx = e, then [[yz]z] = e, where [uv] = uv(u-1)(v-1).
** end{quote}

module COMM (E :: TRIV)
{
  op f : Elt Elt -> Elt
  op g : Elt -> Elt
  op h : Elt Elt -> Elt
  op e : -> Elt
  vars x y z : Elt
  eq f(e,x) = x .
  eq f(g(x),x) = e .
  eq f(f(x,y),z) = f(x,f(y,z)) .
  eq h(x,y) = f(x,f(y,f(g(x),g(y)))).
  eq f(x,f(x,x)) = e .
}

open COMM .
protecting (FOPL-CLAUSE)
ops a b : -> Elt .
goal h(h(a,b),b) = e .
option reset
flag (auto,on)
flag (universal-symmetry,on)     -- X = X
resolve .
close
