** $Id: tba_gg.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** traslated from examples of OTTER-3.0.5 examples/auto/tba_gg.in
** begin{quote}
--  Ternary boolean algebra:  g(g(x)) = x.
** end{quote}

module TBA (E :: TRIV)
{
  op f : Elt Elt Elt -> Elt
  op g : Elt -> Elt
  vars v w x y z : Elt
  eq f(f(v,w,x),y,f(v,w,z)) = f(v,w,f(x,y,z)).
  eq f(y,x,x) = x .
  eq f(x,x,y) = x .
  eq f(g(y),y,x) = x .
  eq f(x,y,g(y)) = x .
}

option reset
flag(auto,on)
flag(universal-symmetry,on)

open TBA
protecting (FOPL-CLAUSE)
op a : -> Elt .

goal g(g(a)) = a .
resolve .
close
--
eof
