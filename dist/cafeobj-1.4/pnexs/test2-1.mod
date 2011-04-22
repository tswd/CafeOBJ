** $Id: test2-1.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** commutativity
** 
-- paramodulation, demodulation test

module TEST2
{
  [ Elt ]
  op _*_ : Elt Elt -> Elt
  op 1 : -> Elt
  op - : Elt -> Elt

  vars x y z : Elt
  eq (x * y) * z = x * (y * z) .
  eq 1 * x = x .
  eq x * 1 = x .
  eq -(x) * x = 1 .
  eq x * -(x) = 1 .
  eq x * x = 1 .
}

option reset

open TEST2
protecting (FOPL-CLAUSE)
flag(auto,on)
param(stats-level,4)
goal \A[X:Elt, Y:Elt] X * Y = Y * X .
resolve .
close
-- 
eof





