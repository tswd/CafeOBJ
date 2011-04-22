** $Id: test1-2.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** 
-- negative hyper resolution

module TEST1-2
{
  [ Elt ]
  pred P : Elt Elt
  pred Q : Elt
  pred R : Elt
  op f : Elt -> Elt
}
open TEST1-2
protecting (FOPL-CLAUSE)
op a : -> Elt .
let ax1 = \A[X:Elt] P(X, a) | Q(X) .
let ax2 = \A[X:Elt] P(f(X),X) -> R(X) .

ax ax1 .
ax ax2 .
let goal = ~(Q(f(a)) | R(a)) .

option reset
flag(neg-hyper-res,on)
flag(factor,on)
flag(unit-deletion,on)
-- goal goal .
db reset
sos = {goal}
resolve .
close
--

eof

