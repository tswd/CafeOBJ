-- Replied: Thu, 27 Jan 2000 20:13:18 +0900
-- Replied: "Akira Mori <amori@jaist.ac.jp> sawada@sra.co.jp"
-- Return-Path: amori@jaist.ac.jp
-- Received: from srasva.sra.co.jp (root@srasva [133.137.12.2]) by sras75.sra.co.jp (8.8.8+2.7Wbeta7/3.4W-sra) with ESMTP id PAA04120 for <sawada@sras75.sra.co.jp>; Thu, 27 Jan 2000 15:38:54 +0900 (JST)
-- Received: from sranha.sra.co.jp (sranha [133.137.8.8])
-- 	by srasva.sra.co.jp (8.8.7/3.6Wbeta7-srambox) with ESMTP id PAA13339
-- 	for <sawada@srasva.sra.co.jp>; Thu, 27 Jan 2000 15:38:54 +0859 (JST)
-- Received: from sraigw.sra.co.jp (sraigw-hub [133.137.8.14])
-- 	by sranha.sra.co.jp (8.8.7/3.6Wbeta7-sranha) with ESMTP id PAA02911
-- 	for <sawada@sra.co.jp>; Thu, 27 Jan 2000 15:38:53 +0859 (JST)
-- Received: from mail.jaist.ac.jp (mex.jaist.ac.jp [150.65.7.20])
-- 	by sraigw.sra.co.jp (8.8.7/3.7W-sraigw) with ESMTP id PAA17339
-- 	for <sawada@sra.co.jp>; Thu, 27 Jan 2000 15:39:07 +0900 (JST)
-- Received: from localhost (localhost [127.0.0.1]) by mail.jaist.ac.jp (3.7W-jaist_mail) with ESMTP id PAA19768 for <sawada@sra.co.jp>; Thu, 27 Jan 2000 15:39:06 +0900 (JST)
-- To: Toshimi Sawada <sawada@sra.co.jp>
-- Subject: BAKERY Update
-- Message-Id: <20000127154642C.amori@jaist.ac.jp>
-- Date: Thu, 27 Jan 2000 15:46:42 +0900
-- From: Akira Mori <amori@jaist.ac.jp>
-- X-Dispatcher: imput version 980905(IM100)
-- Mime-Version: 1.0
-- Content-Type: Text/plain; charset=iso-2022-jp
-- Lines: 273
-- Content-Length: 9013

-- $B_7ED$5$s$3$s$K$A$O!%$3$C$A$O$^$?@c$G!$$9$4$/4($$$G$9!%(B

-- $B=I$N7o$O:#F|!$FsLZ@h@8$HAjCL$7$F7h$a$^$9!%Cf@n$5$s$O$b$&$7$g$&$,$J$$$_(B
-- $B$?$$$G$9$M!%:#EY$O;d$+$iD>@\%W%m%8%'%/%H$+$i$O$:$l$F$b$i$&$h$&$K(B($B$d$s(B
-- $B$o$j(B)$BMj$`$3$H$K$7$^$9!%(B

-- $B$G!$Nc$N(B BAKERY $B$NNcBj$N:G?7>u67$G$9$,!$:G8e$K;D$C$F$$$?%4!<%k$NH?G}$K(B
-- $B$O$$$A$*$&@.8y$7$?$N$G$9$,!$(Bneg-hyper-res $B$N$_$r;H$&$H$$$&@_Dj$G$7$+%@(B
-- $B%a$G$7$?!%(BPigNose $B$G$O(B($B$H$$$&$+(B Otter $B$G$b(B)$B!$@a$d%j%F%i%k$N(B ordering 
-- $B$r@Q6KE*$KMxMQ$7$F$$$k$N$G!$>u67$K$h$C$FB^>.O)$KF~$j9~$s$G$7$^$&$N$O$7$g(B
-- $B$&$,$J$$$G$9$M!%(B

-- $B$H$j$"$($:$N%U%!%$%k$rE:IU$7$^$9$N$G!$_7ED$5$s$NJ}$G$b$$$8$C$F$_$F$b$i(B
-- $B$($^$9$+!%$?$@!$$[$H$s$I9M$($i$l$k$3$H$O;d$b$d$j$^$7$?$N$G!$:G8e$K;D$C(B
-- $B$F$$$k%4!<%k$r$J$k$Y$/$=$N$^$^$N@_Dj$G>ZL@$G$-$k$h$&$JJ}8~$G;n$7$F$b$i(B
-- $B$($k$H$$$$$H;W$$$^$9!%(B

-- ??? $B$N%3%a%s%H$N$D$$$F$$$k$N$,:G8e$NFq4X$G$9!%$3$$$D$rH?G}$9$k$K$O!$(B

--   * $B=R8l(B P $B$N=gHV$,(B($B:#$H(B)$B5U$N$b$N$K$7$F!$(B
--   * ax S = non-CS | S = please | S = wait | S = CS $B$NBe$o$j$r(B
--     $B$=$l$>$l(B CUSTOMER{1,2}$B$GDj5A$7!$(B
--   * flag(hyper-res,off)$B!$(Bflag(neg-hyper-res,on) $B$H$9$k(B

-- $BI,MW$,$"$j$^$9!%(BSOS $B$O$G$-$k$@$1>/$J$/$7$J$$$HGzH/$7$^$9!%(B

-- $B$"$H!$$"$k$HJXMx$@$H;W$&5!G=$O!$(B

--   * SOS $B$r%=!<%9$GD>@\@_Dj$G$-$k$h$&$K$7$?$$!%(B
--     ($B:#$O(B list axiom $B$G3NG'$7$F$+$i;XDj$7$F$$$k$,!$$3$l$@$HJQ99$,$"$kEY(B
--      $B$K$d$jD>$9$N$,BgJQ(B)
--   * flag(universal-symmetry,on) $B$,(B auto mode $B0J30$G$b8z$$$F$[$7$$!%(B
--     ($B:#$O(B auto mode $B0J30$G$O(B ax M = M $B$J$I$HD>@\=q$+$J$$$H$$$1$J$$$h$&(B
--     $B$G$"$k(B)
--   * $B3F%4!<%k$r>ZL@$9$kEY$K0l$+$i%=!<%9$rFI$_9~$s$G!$(Bprocess-input $B$7$F(B
--     $B$H$$$&$h$&$@$H<j4V$,$+$+$j$9$.$k!%(BLisp $B$N(B fasl $B$_$?$$7A<0$,M_$7$$!%(B
--   * $B$R$g$C$H$7$?$i(B ur-res $B$NJ}$,(B sos + hyper-res $B$h$jHyD4@0$,8z$/$+$b(B
--     $BCN$l$J$$!%(B

-- $BK\3JE*$J$b$N$H$7$F$O!$(B

--   * $BITF0E@$N7+$jJV$77W;;$NA22=<0$r(B while $BJ8$N$h$&$K%9%/%j%W%HE*$KDj5A(B
--     $B$G$-$k$HJXMx(B($B4J0W%a%?5-=R5!G=!)(B)
--   * $BA0$NCJ3,$GF@$i$l$?7k2L(B(SOS)$B$N$&$A!$%4!<%k$K0MB8$7$J$$ItJ,$r:FMxMQ(B
--     $B$7$?$$(B($BFq$7$=$&!)(B)

-- $B$J$I$,$"$j$^$9!%5f6KE*$K$OA0$K$b?($l$?$h$&$K!$2D;k%G!<%?NN0h@lMQ$N7hDj(B
-- $B<jB3$-$rAH$_9~$`$N$,0lHV$@$H;W$$$^$9!%$=$&$9$l$P(B BAKERY $B$NNc$G$bA4$F?t(B
-- $BIC$G=*$k$O$:$@$H;W$C$F$$$^$9!%(BPresburger $B$K$D$$$F$O!$9M$($F$_$?7k2L$d$C(B
-- $B$Q$j(B PVS $BJ}<0$7$+$J$$$h$&$G$9!%M-8BNN0h$K$D$$$F$OA0$K?($l$?M-8B=89g$N(B
-- $B5-K!$,:GE,$@$H;W$$$^$9!%(B

-- $B_7ED$5$s$N0U8+$bJ9$+$;$F$/$@$5$$!%(B

-- $B?9(B $B>4(B
-- -------------------------------------------------------------------------
-- the natural numbers
mod! NATNUM {
  protecting(FOPL-CLAUSE)
  [ NatNum ]
  ops 0 : -> NatNum {constr}
  op s : NatNum -> NatNum {constr}
  --  op _<=_ : NatNum NatNum -> Bool
  pred _<_ : NatNum NatNum -- { meta-demod }
  vars M N : NatNum
  ax ~(s(M) < M) .
  ax [no-conf]: ~(s(M) = M) .
  -- ax [no-conf]: ~(s(M) = 0) .
  ax [ax-41]: M < s(M) .
  ax [ax-42]: 0 < s(M) .
  ax [ax-44]: M = 0 | 0 < M .
  ax ~(0 < M)| ~(M = 0) . 
  ax ~(M = N & M < N) .
  ax ~(M < N & N < M) .
  -- ax M < N | M = N | N < M .
  ax ~(M < 0) .
  -- ax M = M .
}

-- the program counters
mod! STATUS {
  protecting(FOPL-CLAUSE)
  [ Status ]
  ops non-CS please wait CS : -> Status { constr }
  ** system generates no-junk, no-confusion axioms
  -- var S : Status
  -- ax [no-conf]: ~(non-CS = please) .
  -- ax [no-conf]: ~(non-CS = wait) .
  -- ax [no-conf]: ~(non-CS = CS) .
  -- ax [no-conf]: ~(please = wait) .
  -- ax [no-conf]: ~(please = CS) .
  -- ax [no-conf]: ~(wait = CS) .
  ** Status is enumerable by finite constants, thus system
  -- will generates 
  -- ax [no-junk]: S = non-CS | S = please | S = wait | S = CS .
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
  ceq stat1(run1(C,M)) = wait
      if (stat1(C) == wait) and M =/= 0 and M < ticket1(C) .
  ceq ticket1(run1(C,M)) = ticket1(C) if stat1(C) == wait .
  ceq stat1(run1(C,M)) = non-CS if stat1(C) == CS .
  ceq ticket1(run1(C,M)) = 0 if stat1(C) == CS .
--  ax stat1(C) = non-CS | stat1(C) = please | stat1(C) = wait | stat1(C) = CS .
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
  ceq stat2(run2(C,M)) = wait
      if (stat2(C) == wait) and M =/= 0 and (not (ticket2(C) < M)) .
  ceq ticket2(run2(C,M)) = ticket2(C) if stat2(C) == wait .
  ceq stat2(run2(C,M)) = non-CS if stat2(C) == CS .
  ceq ticket2(run2(C,M)) = 0 if stat2(C) == CS .
--  ax stat2(C) = non-CS | stat2(C) = please | stat2(C) = wait | stat2(C) = CS .
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
-- #define P(S:Shop) ::= ~(Stat2(S) = CS & Stat1(S) = CS) .

ax P(shop(c1,c2)) .

ax P(Run1(shop(c1,c2))) .
ax P(Run2(shop(c1 ,c2))) .

-- goal P(Run1(Run2(shop(c1,c2)))) . -- subsumed by the next
ax P(Run2(Run1(shop(c1,c2)))) .
ax P(Run1(Run1(shop(c1,c2)))) .
ax P(Run2(Run2(shop(c1,c2)))) .

ax P(Run2(Run1(Run1(shop(c1,c2))))) . -- ng when stat1(c1) = please
ax P(Run2(Run1(Run2(shop(c1,c2))))) . -- ng when stat2(c2) = please
ax P(Run1(Run1(Run1(shop(c1,c2))))) . -- ng when stat1(c1) = non-CS
-- goal P(Run1(Run1(Run2(shop(c1,c2))))) . -- subsumed by the other cases
-- goal P(Run2(Run2(Run1(shop(c1,c2))))) . -- subsumed by the other cased
ax P(Run2(Run2(Run2(shop(c1,c2))))) . -- ng when stat2(c2) = non-CS

ax P(Run2(Run1(Run1(Run1(shop(c1,c2)))))) . -- ng when stat1(c1) = non-CS
-- goal P(Run2(Run1(Run1(Run2(shop(c1,c2)))))) . -- ok with sos (*)
-- goal P(Run2(Run1(Run2(Run1(shop(c1,c2)))))) . -- ok with sos (*)
ax P(Run2(Run1(Run2(Run2(shop(c1,c2)))))) . -- ng when stat2(c2) = non-CS
-- goal P(Run1(Run1(Run1(Run1(shop(c1,c2)))))) . -- ok with sos (*)
-- goal P(Run1(Run1(Run1(Run2(shop(c1,c2)))))) . -- ok with sos (*)
-- goal P(Run2(Run2(Run2(Run1(shop(c1,c2)))))) . -- ok with sos (*)
-- goal P(Run2(Run2(Run2(Run2(shop(c1,c2)))))) . -- ok with sos (*)

-- goal P(Run2(Run1(Run1(Run1(Run1(shop(c1,c2))))))) . -- ok with sos (*)
goal [ax-13]: P(Run2(Run1(Run1(Run1(Run2(shop(c1,c2))))))) . -- ok ok with sos (+)
-- goal P(Run2(Run1(Run2(Run2(Run1(shop(c1,c2))))))) . -- ???
-- goal P(Run2(Run1(Run2(Run2(Run2(shop(c1,c2))))))) . -- ok ok with sos (+)
}

open PROOF .
 
db reset
option reset
-- flag(no-junk,off)
-- flag(no-confusion,off)

flag(process-input, on)
flag(print-kept, off)
flag(print-new-demod, off)
flag(print-back-demod, off)
flag(print-back-sub, off)
flag(control-memory, on)
param(max-sos, 500).
param(pick-given-ratio, 4).
param(stats-level, 1).
param(max-seconds, 3600).
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
-- flag(back-sub,off)
-- flag(prop-res, off)
-- flag(neg-hyper-res, on)
-- flag(order-hyper, on)
-- flag(binary-res, on)
-- flag(no-new-demod, on)
-- flag(para-into-vars, on)

flag(print-stats,on)
flag(universal-symmetry,on)
-- param(max-weight,28)
param(max-proofs,1)

-- sos = { 13 14 41 42 44 } -- (+)
sos = { ax-13 ax-41 ax-42 ax-44 } -- (+)

-- sos = { 13 14 42 43 45 }

-- sos = { 13 14 } -- (*)

resolve .

close
--
eof
--
$Id
