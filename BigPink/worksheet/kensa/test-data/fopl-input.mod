**>
**> FOPL $BJ8F~NO$K4X$9$k8!::(B
**>

**> $BNc$H$7$FMQ$$$kAH$_9~$_$N(B NAT $B$r%*!<%W%s$9$k(B
open NAT

**> FOPL $BJ8$NF~NO$r2DG=$H$9$k$?$a(B, FOPL-CLAUSE $B$rM"F~(B
protecting(FOPL-CLAUSE)

**> $B8!::$K;HMQ$9$kL?Bj$d=R8l$r@k8@$9$k(B.
--> ops p q r : -> Bool .
--> pred P : Nat .
--> pred Q : Nat .
--> pred R : Nat Nat .
--> pred S : Nat Nat .
--> op  a   : -> Nat .

ops p q r : -> Bool .
pred P : Nat .
pred Q : Nat .
pred R : Nat Nat .
pred S : Nat Nat .
op  a   : -> Nat .

**> FOPL $BJ8$NF~NO;n83(B
--> let t1 = (p -> q) -> (q -> r) .
let t1 = (p -> q) -> (q -> r) .

--> let t2 = \A[X2:Nat]\E[Y1:Nat]\A[X1:Nat]\E[Y2:Nat]R(X1,Y1) & S(X2,Y2) .
let t2 = \A[X2:Nat]\E[Y1:Nat]\A[X1:Nat]\E[Y2:Nat]R(X1,Y1) & S(X2,Y2) .

--> let t3 = (\A[X:Nat]P(X) -> (\E[Y:Nat]R(X,Y))) &
-->          (\A[X:Nat]~ P(X) -> ~ (\E[Y:Nat]R(X,Y))) .
let t3 = (\A[X:Nat]P(X) -> (\E[Y:Nat]R(X,Y))) &
         (\A[X:Nat]~ P(X) -> ~ (\E[Y:Nat]R(X,Y))) .
--> let t4 = (\A[X:Nat]P(X) -> (\E[Y:Nat]R(X,Y))) |
-->          (\A[X:Nat]~ P(X) -> ~ (\E[Y:Nat]R(X,Y))) .
let t4 = (\A[X:Nat]P(X) -> (\E[Y:Nat]R(X,Y))) |
         (\A[X:Nat]~ P(X) -> ~ (\E[Y:Nat]R(X,Y))) .

--> let t5 = \A[X:Nat]P(X) -> 
-->                   (\E[Y:Nat](R(X,Y) -> P(a)) & 
-->                             (\A[Z:Nat]R(Y,Z) -> P(X))) .
let t5 = \A[X:Nat]P(X) -> 
                   (\E[Y:Nat](R(X,Y) -> P(a)) & 
                             (\A[Z:Nat]R(Y,Z) -> P(X))) .

**> $BF~NO$5$l$?(B FOPL $BJ8$NI=<((B
**> t1 : 
-->
show term t1 .
**> t2 : 
-->
show term t2 .
**> t3 :
-->
show term t3 .
**> t4 : 
-->
show term t4
**> t5 : 
-->
show term t5
**
close
--
eof
