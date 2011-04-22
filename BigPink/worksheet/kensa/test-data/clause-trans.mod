**>
**> $B@a7A<0JQ495!G=$N8!::(B
**>
-- test formula translation
open NAT
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

**> $BH?G}%7%9%F%`$N=i4|2=(B
option reset
db reset

**> t1 $B!A(B t5 $B$N3F9`$KBP$7$F@a7A<0JQ49%3%^%s%I$r<B9T$9$k!'(B
--> clause t1 .
clause t1 .
--> clasuse t2 .
clause t2 .
--> clause t3 .
clause t3 .
--> clause t4 .
clause t4 .
--> clause t5 .
clause t5 . 
**
close
--
eof
