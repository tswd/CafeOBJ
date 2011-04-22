**>
**> $B%b%G%k8!::@5>o=*N;$N%1!<%9(B-2
**> 

**> $B<+A3?t(B
mod! NATNUM
{
  protecting(FOPL-CLAUSE)
  [ NatNum ]
  op 0 : -> NatNum
  op s : NatNum -> NatNum
  pred _<_ : NatNum NatNum
  vars M N : NatNum
  ax ~(s(M) < M) .
  ax ~(s(M) = 0) .
  ax [SOS]: M < s(M) .
  ax [SOS]: 0 < s(M) .
  ax ~(s(M) = M) .
  ax [SOS]: M = 0 | 0 < M .
  ax ~(0 < M)| ~(M = 0) . 
  ax ~(M = N & M < N) .
  ax ~(M < N & N < M) .
  ax ~(M < 0) .
  ax M = M .
}

**> $B%b%8%e!<%k(B STATUS
**> $B%7%9%F%`$N<h$jF@$k>uBV$NI=8=(B
mod! STATUS
{
  protecting(FOPL-CLAUSE)
  [ Status ]
  -- non-CS : $B%/%j%F%#%+%k%;%/%7%g%s$K$$$J$$(B
  -- wait   : $BBT$A(B
  -- CS     : $B%/%j%F%#%+%k%;%/%7%g%s30(B
  -- error  : $B%(%i!<>uBV(B
  ops non-CS wait CS error : -> Status
  var S : Status
  ax (S = S) = true .
}

**> CUSTOMER1
**> $B$*5R(B-1
mod* CUSTOMER1
{
  protecting(NATNUM + STATUS)
  *[ Customer1 ]*
  op init1 : -> Customer1
  -- attributes
  bop ticket1 : Customer1 -> NatNum
  bop stat1 : Customer1 -> Status
  -- methods
  bop run1 : Customer1 NatNum -> Customer1
  vars C C1 : Customer1  vars M N : NatNum
  -- $B=i4|>uBV$O(B non-CS
  eq stat1(init1) = non-CS .
  -- $B=i4|$N%A%1%C%H$O(B 0
  eq ticket1(init1) = 0 .
  -- non-CS $B>uBV$J$i(B, $BNs$KJB$s$G(B wait $B>uBV$K$J$k(B
  ax stat1(C) = non-CS -> stat1(run1(C,M))= wait .
  -- $BNs$KJB$s$@(B wait $B>uBV$J$i$P0JA0$O(B non-CS $B$G$"$C$?(B.
  ax stat1(run1(C,M))= wait -> stat1(C) = non-CS .
  -- non-CS $B>uBV$J$i(B, $BNs$KJB$V$H%A%1%C%H$,(B1$BA}$($k(B
  ax stat1(C) = non-CS -> ticket1(run1(C,M)) = s(M) .
  ax stat1(C) = wait & (M = 0 | ~(M < ticket1(C))) 
     -> stat1(run1(C,M)) = CS .
  ax stat1(run1(C,M)) = CS -> stat1(C) = wait .
  ax stat1(C) = wait & ~(M = 0) & M < ticket1(C) 
     -> stat1(run1(C,M)) = error .
  ax stat1(run1(C,M)) = error -> stat1(C) = wait .
  ax stat1(C) = wait -> ticket1(run1(C,M)) = ticket1(C) .
  ax (stat1(C) = CS) = (stat1(run1(C,M)) = non-CS) .
  ax stat1(C) = CS -> ticket1(run1(C,M)) = 0 .
}

**> CUSTOMER2
**> $B$*5R(B2 
mod* CUSTOMER2
{
  protecting(NATNUM + STATUS)
  *[ Customer2 ]*
  op init2 : -> Customer2
  -- attributes
  bop ticket2 : Customer2 -> NatNum
  bop stat2 : Customer2 -> Status
  -- methods
  bop run2 : Customer2 NatNum -> Customer2
  vars C C1 : Customer2  var M : NatNum
  eq stat2(init2) = non-CS .
  eq ticket2(init2) = 0 .
  ax stat2(C) = non-CS -> stat2(run2(C,M))= wait .
  ax stat2(run2(C,M))= wait -> stat2(C) = non-CS .
  ax stat2(C) = non-CS -> ticket2(run2(C,M)) = s(M) .
  ax stat2(C) = wait & (M = 0 | ticket2(C) < M) 
     -> stat2(run2(C,M)) = CS .
  ax stat2(run2(C,M)) = CS -> stat2(C) = wait .
  ax stat2(C) = wait & ~(M = 0) & ~(ticket2(C) < M) 
     -> stat2(run2(C,M)) = error .
  ax stat2(run2(C,M)) = error -> stat2(C) = wait .
  ax stat2(C) = wait -> ticket2(run2(C,M)) = ticket2(C) .
  ax (stat2(C) = CS) = (stat2(run2(C,M)) = non-CS) .
  ax stat2(C) = CS -> ticket2(run2(C,M)) = 0 .
}

**> SHOP : $B$*E9(B
**> bakery algorithm
**>
mod* SHOP
{
  protecting(CUSTOMER1 + CUSTOMER2)
  *[ Shop ]*
  op shop : Customer1 Customer2 -> Shop { coherent }
  bop Run1 : Shop -> Shop
  bop Run2 : Shop -> Shop
  bop Stat1 : Shop -> Status
  bop Stat2 : Shop -> Status
  bop Ticket1 : Shop -> NatNum
  bop Ticket2 : Shop -> NatNum
  op Init : -> Shop
  vars C1 D1 : Customer1   vars C2 D2 : Customer2
  var S : Shop   var B : Bool
  ax B = B .
  eq Init = shop(init1,init2) .
  beq Run1(shop(C1,C2)) = shop(run1(C1,ticket2(C2)),C2) .
  beq Run2(shop(C1,C2)) = shop(C1,run2(C2,ticket1(C1))) .
  eq Stat1(shop(C1,C2)) = stat1(C1) .
  eq Stat2(shop(C1,C2)) = stat2(C2) .
  eq Ticket1(shop(C1,C2)) = ticket1(C1) .
  eq Ticket2(shop(C1,C2)) = ticket2(C2) .
}

**> $B>ZL@$N$?$a$N%b%8%e!<%k(B PROOF
mod* PROOF
{
  protecting(SHOP)

  op c1 : -> Customer1 .
  op c2 : -> Customer2 .
  -- P $B$O(B, $B5R(B-1 $B$H5R(B-2 $B$,(B, $BF1;~$K%/%j%F%#%+%k%;%/%7%g%s$N(B
  -- $B>uBV$KF~$k;v$OL5$$(B, $B$D$^$j%G%C%I%m%C%/$9$k$h$&$J$3$H$O(B
  -- $B$J$$(B, $B$H$$$&$3$H$rI=8=$7$?$b$N(B.
  pred P : Shop .
  #define P(S:Shop) ::= ~(Stat1(S) = CS & Stat2(S) = CS) .

}

**> $BH?G}%(%s%8%s$N%*%W%7%g%s$r@_Dj$9$k!'(B
option reset
flag(process-input, on)
flag(control-memory, on)
flag(kb2, on)
flag(back-unit-deletion, on)
flag(hyper-res, on)
flag(unit-deletion, on)
flag(factor, on)
flag(universal-symmetry,off)
flag(dist-const,on)
flag(input-sos-first,on)
--> $BD9Bg$J%m%0$rM^@)$9$k(B.
flag(quiet,on)
--> $B$7$+$7E}7W>pJs$d>ZL@$O0u;z$9$k(B
evq (setq *print-line-limit* 40)
flag(print-stats,on)
flag(print-proofs, on)
param(max-sos, 500)
param(pick-given-ratio, 4)
param(stats-level, 1)
param(max-proofs,1)
param(max-given,51)
param(max-seconds,1)

**> $B>ZL@BP>]%b%8%e!<%k$N(B OPEN
open PROOF

**> $BH?G}%(%s%8%s=i4|2=(B
db reset

**> sos $B$N@_Dj(B
sos = { SOS }

**> $B%b%G%k8!::%3%^%s%I$N5/F0(B
--> check inv P of shop(c1,c2) from Init
check inv P of shop(c1,c2) from Init

close

