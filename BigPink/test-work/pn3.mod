-- Return-Path: amori@jaist.ac.jp
-- Received: from sranha.sra.co.jp (sranha [133.137.8.8]) by sras75.sra.co.jp (8.8.8+2.7Wbeta7/3.4W-sra) with ESMTP id QAA25734 for <sawada@sras75.sra.co.jp>; Thu, 20 Jan 2000 16:31:40 +0900 (JST)
-- Received: from sraigw.sra.co.jp (sraigw-hub [133.137.8.14])
-- 	by sranha.sra.co.jp (8.8.7/3.6Wbeta7-sranha) with ESMTP id QAA00843
-- 	for <sawada@sras75.sra.co.jp>; Thu, 20 Jan 2000 16:31:39 +0900 (JST)
-- Received: from mail.jaist.ac.jp (mex.jaist.ac.jp [150.65.7.20])
-- 	by sraigw.sra.co.jp (8.8.7/3.7W-sraigw) with ESMTP id QAA13611
-- 	for <sawada@sras75.sra.co.jp>; Thu, 20 Jan 2000 16:31:53 +0900 (JST)
-- Received: from localhost (localhost [127.0.0.1]) by mail.jaist.ac.jp (3.7W-jaist_mail) with ESMTP id QAA29472 for <sawada@sras75.sra.co.jp>; Thu, 20 Jan 2000 16:31:47 +0900 (JST)
-- To: Toshimi & <sawada@sras75.sra.co.jp>
-- Subject: Re: Q 
-- Message-Id: <20000120163854M.amori@jaist.ac.jp>
-- Date: Thu, 20 Jan 2000 16:38:54 +0900
-- From: Akira Mori <amori@jaist.ac.jp>
-- X-Dispatcher: imput version 980905(IM100)
-- Mime-Version: 1.0
-- Content-Type: Text/plain; charset=iso-2022-jp
-- Lines: 150
-- Content-Length: 4426

-- $B_7ED$5$s!$$3$s$K$A$O!%(B

-- $BAaB.?7$7$$%Q%C%A$r;n$7$F$_$?$N$G$9$,!$$A$g$C$H:$$C$F$$$^$9!%(B

-- $B<B$OA0$NNc$G!$(Bwait $B>uBV$GN)$A;_$^$kItJ,$NEy<0$r>JN,$7$F$bNI$$$3$H$K5$(B
-- $BIU$$$?$N$G!$;n$7$F$_$?$iBgBN#2J,0L$G@.8y$7$^$7$?!%$H$3$m$,!$?7$7$$%Q%C(B
-- $B%A$rEv$F$?$b$N$G;n$9$H!$$J$K$+?dO@$,6u2s$j$7$F$$$k$h$&$G!$0l8~$K>ZL@$,(B
-- $B@.8y$9$kC{$7$,$_$i$l$^$;$s!%%U%!%$%k$rE:IU$7$^$9$N$G!$$A$g$C$H8+$F$b$i(B
-- $B$($J$$$G$7$g$&$+!%(B

-- $B$H$b$+$/!$;EMM$r4JN,2=$9$l$P$J$s$H$+(B BAKERY $B$N(B model check $B$O$G$-$=$&(B
-- $B$G$9!%(B

-- $B$"$H!$(BLinux$BHG$N(B ACL $B$rFs$DGc$&$3$H$K$7$^$7$?!%9g7W#5#0K|1_$[$I$G$9!%0l(B
-- $B$D$O_7ED$5$sMQ$G$9$N$G!$$^$?G<IJ$5$l$l$P$*EO$7$7$^$9!%:#;H$C$F$$$k$b$N(B
-- $B$h$j8zN($,NI$$$H$$$$$s$G$9$1$I$M$'!%(B

-- $B?9(B $B>4(B

-- -----------------------------------------------------------------------
-- the natural numbers
mod! NATNUM {
  protecting(FOPL-CLAUSE)
  [ NatNum ]
  ops 0 : -> NatNum { constr }
  op s : NatNum -> NatNum { constr }
  --  pred _<=_ : NatNum NatNum { meta-demod }
  pred _<_ : NatNum NatNum  -- { meta-demod }
  vars M N : NatNum
  ax ~(s(M) < M) .
  -- ax ~(s(M) = 0).
  -- ax ~(s(M) = M).
  ax M < s(M) .
  ax 0 < s(M) .
  ax M = 0 | 0 < M .
  ax ~(0 < M)| ~(M = 0) . 
  ax ~(M = N & M < N) .
  ax ~(M < N & N < M) .
  -- ax M < N | M = N | N < M .
  ax ~(M < 0) .
}

-- the program counters
mod! STATUS {
  protecting(FOPL-CLAUSE)
  [ Status ]
  ops non-CS please wait CS : -> Status { constr }
  ** system generates these in automatic
  -- var S : Status
  -- ax ~(non-CS = please) .
  -- ax ~(non-CS = wait) .
  -- ax ~(non-CS = CS) .
  -- ax ~(please = wait) .
  -- ax ~(please = CS) .
  -- ax ~(wait = CS) .
  -- ax S = non-CS | S = please | S = wait | S = CS .
}

-- customers
mod* CUSTOMER1 {
  protecting(NATNUM + STATUS)
  *[ Customer1 ]*
--  op init1 : -> Customer1
  -- attributes
  bop ticket1 : Customer1 -> NatNum
  bop stat1 : Customer1 -> Status
  -- methods
  bop run1 : Customer1 NatNum -> Customer1
  var C : Customer1  var M : NatNum
--  eq stat1(init1) = non-CS .
--  eq ticket1(init1) = 0 .
  ceq stat1(run1(C,M)) = please if stat1(C) == non-CS .
  ceq ticket1(run1(C,M)) = s(0) if stat1(C) == non-CS .
  ceq stat1(run1(C,M))= wait if stat1(C) == please .
  ceq ticket1(run1(C,M)) = s(M) if stat1(C) == please .
  ceq stat1(run1(C,M)) = CS
      if (stat1(C) == wait) and ((M == 0) or (not (M < ticket1(C)))) .
--  ceq stat1(run1(C,M)) = wait
--      if (stat1(C) == wait) and M =/= 0 and (not (ticket1(C) <= M)) .
  ceq ticket1(run1(C,M)) = ticket1(C) if stat1(C) == wait .
  ceq stat1(run1(C,M)) = non-CS if stat1(C) == CS .
  ceq ticket1(run1(C,M)) = 0 if stat1(C) == CS .
}

mod* CUSTOMER2 {
  protecting(NATNUM + STATUS)
  *[ Customer2 ]*
--  op init2 : -> Customer2
  -- attributes
  bop ticket2 : Customer2 -> NatNum
  bop stat2 : Customer2 -> Status
  -- methods
  bop run2 : Customer2 NatNum -> Customer2
  var C : Customer2  var M : NatNum
--  eq stat2(init2) = non-CS .
--  eq ticket2(init2) = 0 .
  ceq stat2(run2(C,M)) = please if stat2(C) == non-CS .
  ceq ticket2(run2(C,M)) = s(0) if stat2(C) == non-CS .
  ceq stat2(run2(C,M))= wait if stat2(C) == please .
  ceq ticket2(run2(C,M)) = s(M) if stat2(C) == please .
  ceq stat2(run2(C,M)) = CS
      if (stat2(C) == wait) and ((M == 0) or (ticket2(C) < M)) .
--  ceq stat2(run2(C,M)) = wait
--      if (stat2(C) == wait) and M =/= 0 and (not (ticket2(C) < M)) .
  ceq ticket2(run2(C,M)) = ticket2(C) if stat2(C) == wait .
  ceq stat2(run2(C,M)) = non-CS if stat2(C) == CS .
  ceq ticket2(run2(C,M)) = 0 if stat2(C) == CS .
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
--  op Init : -> Shop
  var C1 : Customer1   var C2 : Customer2   var S : Shop
--  eq Init = shop(init1,init2) .
--  beq Run(shop(C1,C2)) = shop(run1(C1,ticket2(C2)),run2(C2,ticket1(C1))) .
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

ax P(Run2(Run1(Run1(shop(c1,c2))))) .
goal P(Run1(Run1(Run2(shop(c1,c2))))) .
}

open PROOF .
option reset
-- flag(propositional-first,off)
flag(auto3, on)
flag(universal-symmetry,on)
-- flag(debug-binary-res,on)
-- flag(very-verbose,on)
-- flag(no-new-demod,on)
-- flag(print-back-sub,on)
param(max-weight,22)
param(max-proofs,1)
-- flag(print-new-demod,on)

resolve .

close

**
eof
**
$Id:
