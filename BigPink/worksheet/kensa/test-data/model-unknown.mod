**>
**> $B%b%G%k8!::ITDj=*N;$N>l9g(B
**> 

set include FOPL-CLAUSE on

-- the natural numbers
mod! NATNUM
{
  [ NatNum ]
  op 0 : -> NatNum
  op s : NatNum -> NatNum
  pred _<_ : NatNum NatNum
  vars M N : NatNum
  ax ~(s(M) < M) .
  ax [SOS1]: ~(s(M) = 0) .
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

-- the program counters
mod! STATUS
{
  [ Status ]
  ops non-CS wait CS : -> Status
  var S : Status
  ax (S = S) = true .
}

-- customers
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
  eq stat1(init1) = non-CS .
  eq ticket1(init1) = 0 .
  ax stat1(C) = non-CS -> stat1(run1(C,M))= wait .
  ax stat1(run1(C,M))= wait 
     -> stat1(C) = non-CS | stat1(C) = wait .
  ax stat1(C) = non-CS -> ticket1(run1(C,M)) = s(M) .
  ax stat1(C) = wait & (M = 0 | ~(M < ticket1(C))) 
     -> stat1(run1(C,M)) = CS .
  ax stat1(run1(C,M)) = CS -> stat1(C) = wait .
  ax stat1(C) = wait & ~(M = 0) & M < ticket1(C) 
     -> stat1(run1(C,M)) = wait .
  ax stat1(C) = wait -> ticket1(run1(C,M)) = ticket1(C) .
  ax (stat1(C) = CS) = (stat1(run1(C,M)) = non-CS) .
  ax stat1(C) = CS -> ticket1(run1(C,M)) = 0 .
}

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
  ax stat2(run2(C,M))= wait 
     -> stat2(C) = non-CS | stat2(C) = wait .
  ax stat2(C) = non-CS -> ticket2(run2(C,M)) = s(M) .
  ax stat2(C) = wait & (M = 0 | ticket2(C) < M) 
     -> stat2(run2(C,M)) = CS .
  ax stat2(run2(C,M)) = CS -> stat2(C) = wait .
  ax stat2(C) = wait & ~(M = 0) & ~(ticket2(C) < M) 
     -> stat2(run2(C,M)) = wait .
  ax stat2(C) = wait -> ticket2(run2(C,M)) = ticket2(C) .
  ax (stat2(C) = CS) = (stat2(run2(C,M)) = non-CS) .
  ax stat2(C) = CS -> ticket2(run2(C,M)) = 0 .
}

-- bakery algorithm
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

mod* PROOF
{

  protecting(SHOP)

  op c1 : -> Customer1 .
  op c2 : -> Customer2 .

  pred P : Shop .
  #define P(S:Shop) ::= ~(Stat1(S) = CS & Stat2(S) = CS) .

}

**> $BH?G}%7%9%F%`$N%*%W%7%g%s@_Dj(B
option reset
flag(control-memory,on)
flag(kb2, on)
flag(back-unit-deletion, on)
flag(hyper-res, on)
flag(unit-deletion, on)
flag(factor, on)
flag(universal-symmetry,off)
flag(dist-const,on)
flag(input-sos-first,on)
**
param(max-proofs,1)
param(max-sos, 150)
param(pick-given-ratio, 4)
param(stats-level, 1)

**> $B@)Ls>r7o$N@_Dj(B
param(max-seconds, 1)
param(max-given, 50)
param(inv-check-max-depth, 4)

flag(quiet,on)
flag(print-proofs,off)
flag(print-stats,on)
**

open PROOF
db reset

**> SOS $B$N@_Dj(B
sos = { SOS SOS1 }

**> $B%b%G%k8!::$N5/F0(B
--> check safety P of shop(c1,c2) from Init
check safety P of shop(c1,c2) from Init

close

