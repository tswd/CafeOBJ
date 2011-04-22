**>
**> FOPL $BJ8$K$h$k8xM}$N@k8@5!G=8!::(B
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

**> FOPL $BJ8$K$h$k8xM}@k8@(B.
--> ax[t1]: (p -> q) -> (q -> r) .
ax[t1]: (p -> q) -> (q -> r) .

--> ax[t2]: \A[X2:Nat]\E[Y1:Nat]\A[X1:Nat]\E[Y2:Nat]R(X1,Y1) & S(X2,Y2) .
ax[t2]: \A[X2:Nat]\E[Y1:Nat]\A[X1:Nat]\E[Y2:Nat]R(X1,Y1) & S(X2,Y2) .

--> goal[t3]: (\A[X:Nat]P(X) -> (\E[Y:Nat]R(X,Y))) &
-->          (\A[X:Nat]~ P(X) -> ~ (\E[Y:Nat]R(X,Y))) .
goal[t3]: (\A[X:Nat]P(X) -> (\E[Y:Nat]R(X,Y))) &
          (\A[X:Nat]~ P(X) -> ~ (\E[Y:Nat]R(X,Y))) .
--> goal[t4]: (\A[X:Nat]P(X) -> (\E[Y:Nat]R(X,Y))) |
-->           (\A[X:Nat]~ P(X) -> ~ (\E[Y:Nat]R(X,Y))) .
goal[t4]: (\A[X:Nat]P(X) -> (\E[Y:Nat]R(X,Y))) |
          (\A[X:Nat]~ P(X) -> ~ (\E[Y:Nat]R(X,Y))) .

--> ax[t5] \A[X:Nat]P(X) -> 
-->                 (\E[Y:Nat](R(X,Y) -> P(a)) & 
-->                           (\A[Z:Nat]R(Y,Z) -> P(X))) .
ax[t5]: \A[X:Nat]P(X) -> 
           (\E[Y:Nat](R(X,Y) -> P(a)) & 
                     (\A[Z:Nat]R(Y,Z) -> P(X))) .

**> $B%b%8%e!<%k$rI=<($7(B, $B>e5-$N8xM}$,@5$7$/<u$1IU$1$i$l$F(B
**> $B$$$k$3$H3NG'$9$k(B.
show .
**
close
--
eof
