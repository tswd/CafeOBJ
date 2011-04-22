**>
**> $B>\:Y2=8!>Z5!G=(B
**> view $B$,>\:Y2=$H$J$i$J$$>l9g(B-1
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
--> $B%b%N%$%I$N(B2$B9`1i;;$r$+$1;;$K(B
--> $BC10L85$r(B 1(s(0)) $B$K<LA|$9$k!%(B
**>
view times from MON to TIMES-NAT {
  sort Elt -> Nat, 
  op _;_ -> _*_,  
  op null -> s(0)
}

**> TIME-NAT $B$GDj5A$5$l$F$$$k<+A3?t>e$N$+$1;;$O!$(B
**> $BC10L85$r(B 1 $B$H$7$?%b%N%$%I$r9=@.$9$k$+$I$&$+$r8+$k!%(B
**> $B$D$^$j(B, $B;EMM<M(B times $B$O!$(BTIMES-NAT $B$,(B,
**> MON $B$N>\:Y2=$rDj5A$9$k$b$N$G$"$k$+$rD4$Y$k!%(B

--> $B>\:Y$J>pJs$,M_$7$$$N$G%U%i%0$r@_Dj$9$k(B
--> flag(debug-refine,on)
flag(debug-refine,on)
--> $B$?$@$7!$D9Bg$J%m%0$OK>$^$7$/$J$$$N$G!$(Bgiven clause
--> $B$N0u;z$OM^@)$9$k(B
flag(print-given,off)

--> check $B%3%^%s%I$N5/F0(B
--> check refinement times
check refinement times

