** $Id: test7.mod,v 1.1.1.1 2003-06-19 08:30:08 sawada Exp $
--
-- another tiny test

module TEST7
{
  [Elt]
  pred P : Elt
  pred Q : Elt
  pred R : Elt
  pred S : Elt
}

open TEST7 .
protecting (FOPL-CLAUSE)

goal (\E[X:Elt]P(X)) & (\E[X:Elt]Q(X)) 
     -> (\A[X:Elt]P(X) -> R(X)) & (\A[X:Elt]Q(X) -> S(X))
     <-> (\A[X:Elt, Y:Elt] P(X) & Q(Y) -> R(X) & S(Y)).

option reset
flag(auto,on)
resolve .
close

eof
