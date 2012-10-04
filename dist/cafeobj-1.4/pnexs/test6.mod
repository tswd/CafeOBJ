** $Id: test6.mod,v 1.1.1.1 2003-06-19 08:30:08 sawada Exp $
** a tiny test
**
module TEST6
{
  [ Elt ]
  pred R : Elt Elt
}

open TEST6 .
protecting (FOPL-CLAUSE)
goal (\A[X:Elt] R(X,X)) ->  (\A[X:Elt]\E[Y:Elt] R(X,Y)) .

option reset
flag(auto,on)
resolve .
close
eof
