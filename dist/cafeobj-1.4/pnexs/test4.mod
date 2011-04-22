** $Id: test4.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** paramodulation test
** 
module TEST4
{
  [ Elt ]
  op f : Elt Elt -> Elt
  op g : Elt -> Elt
  op h : Elt Elt -> Elt
  op e : -> Elt
  ops a b : -> Elt
  vars X Y Z : Elt
  eq f(e,X) = X .
  eq f(g(X), X) = e .
  eq f(f(X,Y), Z) = f(X,f(Y,X)) .
  eq h(X,Y) = f(X, f(Y,f(g(X), g(Y)))) .
  eq f(X,f(X,X)) = e .
}

option reset

open TEST4
protecting (FOPL-CLAUSE)
goal h(h(a,b),b) = e .
flag(auto,on)
param(stats-level,4)
resolve .
close
eof




