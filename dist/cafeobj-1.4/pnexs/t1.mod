** $Id: t1.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
-- test formula translation
open NAT .
protecting(FOPL-CLAUSE)
ops p q r : -> Bool .
pred P : Nat .
pred Q : Nat .
pred R : Nat Nat .
pred S : Nat Nat .
op  a   : -> Nat .
let t1 = (p -> q) -> (q -> r) .
let t2 = \A[X2:Nat]\E[Y1:Nat]\A[X1:Nat]\E[Y2:Nat]R(X1,Y1) & S(X2,Y2) .
let t3 = (\A[X:Nat]P(X) -> (\E[Y:Nat]R(X,Y))) &
         (\A[X:Nat]~ P(X) -> ~ (\E[Y:Nat]R(X,Y))) .
let t4 = (\A[X:Nat]P(X) -> (\E[Y:Nat]R(X,Y))) |
         (\A[X:Nat]~ P(X) -> ~ (\E[Y:Nat]R(X,Y))) .

let t5 = \A[X:Nat]P(X) -> 
                   (\E[Y:Nat](R(X,Y) -> P(a)) & 
                             (\A[Z:Nat]R(Y,Z) -> P(X))) .
option reset
db reset

**> t1 : 
show term t1 .
clause t1 .
**> t2 : 
show term t2 .
clause t2 .
**> t3 :
show term t3 .
clause t3 .
**> t4 : 
show term t4
clause t4 .
**> t5 : 
show term t5
clause t5 . 
**
close
--
eof
