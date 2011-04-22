**>
**> Paramodulation $B$N8!::(B
**>
--  Robbins algebra
-- 
--  If a Robbins algebra has an element c such that x+c=c,
--  then it is Boolean.
-- 
--  Commutativity, associativity, and Huntington's axiom 
--  axiomatize Boolean algebra.

module! ROBBINS (E :: TRIV)
{
  op _+_ : Elt Elt -> Elt { r-assoc }
  op n : Elt -> Elt
  vars x y z : Elt
  eq x + y = y + x .
  eq (x + y) + z = x + (y + z) .
  eq  n(n(x + y) + n(x + n(y))) = x . -- Robbins axiom
}

**> $B%*%W%7%g%s$N=i4|2=(B
option reset

**> auto $B%b!<%I$G<B9T(B
flag(auto,on)
flag(universal-symmetry, on)

open ROBBINS
protecting (FOPL-CLAUSE)

ops A B C : -> Elt .

**> $B2>Dj(B --- exists a 1
--> eq x + C = C .
eq x + C = C .

**> $B>ZL@$7$?$$J8(B
--> goal n(A + n(B)) + n(n(A) + n(B)) = B .
goal n(A + n(B)) + n(n(A) + n(B)) = B .

**> $BH?G}%(%s%8%s$r5/F0(B
resolve .
close
** 
eof

