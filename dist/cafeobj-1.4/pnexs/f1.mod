** $Id: f1.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** this example shows that factoring is necessary for completeness.
**                         by sawada@sra.co.jp
module T1
{ [E]
  protecting (FOPL-CLAUSE)
  pred P : E
}

option reset
open T1 .
ax P(X:E) | P(Y:E) .
ax ~(P(X:E)) | ~(P(Y:E)) .
flag(auto,on)
resolve .
close
**

**> we will set(override) flag(factor,off), compare with the above.

option reset
open T1 .
let a1 = P(X:E) | P(Y:E) .
ax ~(P(X:E)) | ~(P(Y:E)) .
** we need db reset because we are in manual mode.
db reset
sos = { a1 }                 -- sos also accpepts `let' variables.
flag(binary-res,on)
flag(unit-deletion,on)
flag(factor,off)
**> this should fail.
resolve .
**> list usable
list usable                  -- this can be hepfull for your study.
close
