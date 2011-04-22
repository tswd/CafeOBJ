** $Id: robbins.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** translated from otter 3.0.5 examples auto/robbins.in
** begin{quote}
--  Robbins algebra
-- 
--  If a Robbins algebra has an element c such that x+c=c,
--  then it is Boolean.
-- 
--  Commutativity, associativity, and Huntington's axiom 
--  axiomatize Boolean algebra.
** end{quote}

module! ROBBINS (E :: TRIV)
{
  op _+_ : Elt Elt -> Elt { r-assoc }
  op n : Elt -> Elt
  vars x y z : Elt
  eq x + y = y + x .
  eq (x + y) + z = x + (y + z) .
  eq  n(n(x + y) + n(x + n(y))) = x . -- Robbins axiom
}

option reset
flag(auto,on)
flag(universal-symmetry, on)
-- flag(back-sub,off)

open ROBBINS
protecting (FOPL-CLAUSE)

ops A B C : -> Elt .

** hypothesis---exists a 1
eq x + C = C .

**
goal n(A + n(B)) + n(n(A) + n(B)) = B .

resolve .
close
** 
eof

