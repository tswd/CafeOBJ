**>
**> $B>\:Y2=8!>Z5!G=(B
**> view $B$,>\:Y2=$H$J$C$F$$$k>l9g(B-1
**> $B<jF0$G(B view $B$rDj5A$9$k!%(B

**> $B<+A3?t>e$N$+$1;;$HB-$7;;$NDj5A$5$l$?%b%8%e!<%k(B TIMES-NAT
mod! TIMES-NAT {
  [ NzNat Zero < Nat ]

  op 0 : -> Zero
  op s_ : Nat -> NzNat
  op _+_ : Nat Nat -> Nat
  op _*_ : Nat Nat -> Nat

  vars M N : Nat 
    
  eq N + s(M) = s(N + M) .
  eq N + 0 = N . 
  eq 0 + N = N .
  eq 0 * N = 0 .
  eq N * 0 = 0 .
  eq N * s(M) = (N * M) + N .
}

**> $B%b%N%$%I(B
mod* MON {
  [ Elt ]

  op null :  ->  Elt
  op _;_ : Elt Elt -> Elt {assoc idr: null} 
}

**> view $B$NDj5A(B
--> $B%b%N%$%I$N(B2$B9`1i;;$rB-$7;;$K!$(B
--> $BC10L85$r(B 0 $B$K<LA|$9$k!%(B
**>
view plus from MON to TIMES-NAT {
  sort Elt -> Nat, 
  op _;_ -> _+_,  
  op null -> 0 
}

**> $B<+A3?t>e$NB-$7;;$O%b%N%$%I$H2r<a$G$-$k(B
**> $B$D$^$j(B, $B;EMM<M(B plus $B$O!$(BTIMES-NAT $B$,(B,
**> MON $B$N>\:Y2=$rDj5A$9$k$b$N$G$"$k$3$H$r<($9!%(B

--> check refinement plus
check refinement plus
