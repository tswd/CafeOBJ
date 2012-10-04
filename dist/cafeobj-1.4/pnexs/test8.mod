** $Id: test8.mod,v 1.1.1.1 2003-06-19 08:30:08 sawada Exp $
** 
** subset relation
** 
module TEST8 (E :: TRIV)
{
  protecting (FOPL-CLAUSE)
  pred _<=_ : Elt Elt
  ax \A[X:Elt,Y:Elt] X <= Y <-> (\A[W:Elt] W <= X -> W <= Y) .
}

**> set sos by hand
open TEST8 .
let goal = ~ ( \A[X:Elt,Y:Elt,Z:Elt] (X <= Y & Y <= Z) -> X <= Z ) .
-- goal \A[X:Elt,Y:Elt,Z:Elt] X <= Y & Y <= Z -> X <= Z .
option reset .
flag(hyper-res,on) .
param(max-proofs,1) .
db reset .
sos = { goal } .
--> list sos
list sos .
resolve .
close .

**> automatic mode
open TEST8 .
goal \A[X:Elt,Y:Elt,Z:Elt] X <= Y & Y <= Z -> X <= Z .
option reset .
flag(auto,on) .
resolve .
close .
**
eof
