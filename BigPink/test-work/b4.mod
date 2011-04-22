-- Return-Path: amori@jaist.ac.jp
-- Received: from srasva.sra.co.jp (root@srasva [133.137.12.2]) by sras75.sra.co.jp (8.8.8+2.7Wbeta7/3.4W-sra) with ESMTP id PAA29675 for <sawada@sras75.sra.co.jp>; Thu, 27 Jul 2000 15:26:50 +0900 (JST)
-- Received: from sranha.sra.co.jp (sranha [133.137.8.8])
-- 	by srasva.sra.co.jp (8.8.7/3.6Wbeta7-srambox) with ESMTP id PAA02896
-- 	for <sawada@srasva.sra.co.jp>; Thu, 27 Jul 2000 15:26:35 +0900 (JST)
-- Received: from sraigw.sra.co.jp (sraigw-hub [133.137.8.14])
-- 	by sranha.sra.co.jp (8.8.7/3.6Wbeta7-sranha) with ESMTP id PAA07272
-- 	for <sawada@sra.co.jp>; Thu, 27 Jul 2000 15:26:34 +0900 (JST)
-- Received: from mail.jaist.ac.jp (mex.jaist.ac.jp [150.65.7.20])
-- 	by sraigw.sra.co.jp (8.8.7/3.7W-sraigw) with ESMTP id PAA27226
-- 	for <sawada@sra.co.jp>; Thu, 27 Jul 2000 15:26:48 +0900 (JST)
-- Received: from localhost (localhost [127.0.0.1]) by mail.jaist.ac.jp (3.7W-jaist_mail) with ESMTP id PAA09417 for <sawada@sra.co.jp>; Thu, 27 Jul 2000 15:26:47 +0900 (JST)
-- To: sawada@sra.co.jp
-- Subject: major breakthrough!!
-- Message-Id: <20000727153509U.amori@jaist.ac.jp>
-- Date: Thu, 27 Jul 2000 15:35:09 +0900
-- From: Akira Mori <amori@jaist.ac.jp>
-- X-Dispatcher: imput version 980905(IM100)
-- Mime-Version: 1.0
-- Content-Type: Text/plain; charset=iso-2022-jp
-- Lines: 243
-- Content-Length: 7096

-- $B_7ED$5$s!$$3$s$K$A$O!%(B

-- $B$"$$$b$+$o$i$:(B bakery algorithm $B$H3JF.$7$F$$$?$N$G$9$,!$>uBVA+0\$r$h$j(B
-- $B>\:Y$KDj5A$7$F!$M-8BNN0h$G$"$k(B STATUS $B$NDj5A$r(B meta-equation $B$GDj5A$7(B
-- $B$F$_$?$H$3$m!$6C$/$h$&$J9bB.2=$,<B8=$G$-$^$7$?!%$3$l$J$iAj8_GS=|$N%b%G(B
-- $B%k8!::A4BN$G$b(B 1$B!A(B2 $BJ,$G$G$-$=$&$G$9!%@gBf$N%G%b$O$3$l$G$$$$$G$9$M!%0J(B
-- $B2<$K%U%!%$%k(B bakery4.mod $B$rE:IU$7$^$9!%$J$*<B9T;~4V$O(B PentiumIII
-- 750MHz $B%^%7%s$G$N7k2L$G$9!%(B

-- $B?9(B $B>4(B

-- ----------------------------------------------------------------------
-- the natural numbers
mod! NATNUM {
  protecting(FOPL-CLAUSE)
  [ NatNum ]
  op 0 : -> NatNum
  op s : NatNum -> NatNum
  pred _<_ : NatNum NatNum  -- { meta-demos }
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

-- the program counters
mod! STATUS {
  protecting(FOPL-CLAUSE)
  [ Status ]
  ops non-CS please wait CS : -> Status
  var S : Status
  ** 
  --  ax (non-CS = please) = false .
  --  ax (please = non-CS) = false .
  --  ax (non-CS = wait) = false .
  --  ax (wait = non-CS) = false .
  --  ax (non-CS = CS) = false .
  --  ax (CS = non-CS) = false .
  --  ax (please = wait) = false .
  --  ax (wait = please) = false .
  --  ax (please = CS) = false .
  --  ax (CS = please) = false .
  --  ax (wait = CS) = false .
  --  ax (CS = wait) = false .
  ax (S = S) = true .
}

-- customers
mod* CUSTOMER1 {
  protecting(NATNUM + STATUS)
  *[ Customer1 ]*
  op init1 : -> Customer1
  -- attributes
  bop ticket1 : Customer1 -> NatNum
  bop stat1 : Customer1 -> Status
  -- methods
  bop run1 : Customer1 NatNum -> Customer1
  vars C C1 : Customer1  var M : NatNum
  eq stat1(init1) = non-CS .
  eq ticket1(init1) = 0 .
  ax (stat1(C) = non-CS) = (stat1(run1(C,M)) = please) .
  ax stat1(C) = non-CS -> ticket1(run1(C,M)) = s(0) .
  ax stat1(C) = please -> stat1(run1(C,M))= wait .
  ax stat1(run1(C,M))= wait -> stat1(C) = please | stat1(C) = wait .
  ax stat1(C) = please  -> ticket1(run1(C,M)) = s(M) .
  ax stat1(C) = wait & (M = 0 | ~(M < ticket1(C))) -> stat1(run1(C,M)) = CS .
  ax stat1(run1(C,M)) = CS -> stat1(C) = wait .
  ax stat1(C) = wait & ~(M = 0) & M < ticket1(C) -> stat1(run1(C,M)) = wait .
  ax stat1(C) = wait -> ticket1(run1(C,M)) = ticket1(C) .
  ax (stat1(C) = CS) = (stat1(run1(C,M)) = non-CS) .
  ax stat1(C) = CS -> ticket1(run1(C,M)) = 0 .
}

mod* CUSTOMER2 {
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
  ax (stat2(C) = non-CS) = (stat2(run2(C,M)) = please) .
  ax stat2(C) = non-CS -> ticket2(run2(C,M)) = s(0) .
  ax stat2(C) = please -> stat2(run2(C,M))= wait .
  ax stat2(run2(C,M))= wait -> stat2(C) = please | stat2(C) = wait .
  ax stat2(C) = please -> ticket2(run2(C,M)) = s(M) .
  ax stat2(C) = wait & (M = 0 | ticket2(C) < M) -> stat2(run2(C,M)) = CS .
  ax stat2(run2(C,M)) = CS -> stat2(C) = wait .
  ax stat2(C) = wait & ~(M = 0) & ~(ticket2(C) < M) -> stat2(run2(C,M)) = wait .
  ax stat2(C) = wait -> ticket2(run2(C,M)) = ticket2(C) .
  ax (stat2(C) = CS) = (stat2(run2(C,M)) = non-CS) .
  ax stat2(C) = CS -> ticket2(run2(C,M)) = 0 .
}

-- bakery algorithm
mod* SHOP {
  protecting(CUSTOMER1 + CUSTOMER2)
  *[ Shop ]*
  op shop : Customer1 Customer2 -> Shop { coherent }
--  bop Run : Shop -> Shop
  bop Run1 : Shop -> Shop
  bop Run2 : Shop -> Shop
  bop Stat1 : Shop -> Status
  bop Stat2 : Shop -> Status
  bop Ticket1 : Shop -> NatNum
  bop Ticket2 : Shop -> NatNum
  op Init : -> Shop
  vars C1 D1 : Customer1   vars C2 D2 : Customer2
  var S : Shop
  var B : Bool
  eq Init = shop(init1,init2) .
  beq Run1(shop(C1,C2)) = shop(run1(C1,ticket2(C2)),C2) .
  beq Run2(shop(C1,C2)) = shop(C1,run2(C2,ticket1(C1))) .
  eq Stat1(shop(C1,C2)) = stat1(C1) .
  eq Stat2(shop(C1,C2)) = stat2(C2) .
  eq Ticket1(shop(C1,C2)) = ticket1(C1) .
  eq Ticket2(shop(C1,C2)) = ticket2(C2) .
}

mod* PROOF {

protecting(SHOP)

op c1 : -> Customer1 .
op c2 : -> Customer2 .

pred P : Shop .
#define P(S:Shop) ::= ~(Stat1(S) = CS & Stat2(S) = CS) .

}

option reset
flag(process-input, on)
flag(print-kept, off)
flag(print-new-demod, off)
flag(print-back-demod, off)
flag(print-back-sub, off)
flag(control-memory, on)
param(max-sos, 500).
param(pick-given-ratio, 4).
param(stats-level, 1).
lisp (setq *print-line-limit* 40)
flag(kb2, on)
-- flag(para-from, on)
-- flag(para-into, on)
-- flag(para-from-right, off)
-- flag(para-into-right, off)
-- flag(para-from-vars, off)
-- flag(eq-units-both-ways, on)
-- flag(dynamic-demod-all, on)
-- flag(dynamic-demod, on)
-- flag(order-eq, on)
-- flag(back-demod, on)
-- flag(lrpo, on)

flag(hyper-res, on)
flag(unit-deletion, on)
flag(factor, on)

flag(input-sos-first,on)

-- flag(meta-paramod, on)
-- flag(prop-res, off)
-- flag(neg-hyper-res, on)
-- flag(order-hyper, on)
-- flag(binary-res, on)
-- flag(no-new-demod, on)
-- flag(para-into-vars, on)

-- flag(back-unit-deletion,on)

flag(universal-symmetry,off)
-- every constant is different from each other
flag(dist-const,on)
-- flag(debug-dist-const,on)
-- randomly select a given clause among those having the same pick-weight
-- flag(randomize-sos,on)
flag(quiet,on)
flag(print-stats,on)
param(max-proofs,1)
param(max-seconds,13)
param(max-given,122)

open PROOF
db reset

sos = { SOS }

check inv P of shop(c1,c2) from Init
close
eof
--
$Id:
