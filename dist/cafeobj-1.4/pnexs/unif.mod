** $Id: unif.mod,v 1.1.1.1 2003-06-19 08:30:08 sawada Exp $
**
**
**
module! UTEST
{
  [ Elt ]
  pred P : Elt Elt Elt
  op f : Elt Elt -> Elt
  ops g h : Elt -> Elt
  op a : -> Elt
}

open UTEST .

-- test data

unify f(X:Elt, Y:Elt) to f(Z:Elt, g(Z)) .
close .

eof .
**

