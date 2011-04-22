** $Id: test1.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** a tiny test
** 

-- make FOPL-CLAUSE be imported in automatic
set include FOPL-CLAUSE on

module TEST1
{
  [ Elt ]
  pred human : Elt
  pred mortal : Elt
  op Socrates : -> Elt
  ax \A[X:Elt] human (X:Elt) -> mortal(X) .
  ax human(Socrates) .
}

open TEST1
**> auto mode
goal mortal(Socrates) .
option reset
flag(auto, on)
flag(very-verbose,on)
param(max-proofs, 1)
resolve .
close

**> manual mode
option reset
open TEST1
let g = ~(mortal(Socrates)) .
db reset

sos = {g}
flag(neg-hyper-res, on)
resolve .
close
--
eof
