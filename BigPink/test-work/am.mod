-- Return-Path: amori@jaist.ac.jp 
-- Received: from srasva.sra.co.jp (root@srasva [133.137.12.2]) by sras75.sra.co.jp (8.6.13/3.4W-sra) with ESMTP id XAA21348 for <sawada@sras75.sra.co.jp>; Sat, 13 Nov 1999 23:15:32 +0900
-- Received: from sranha.sra.co.jp (sranha [133.137.8.8])
-- 	by srasva.sra.co.jp (8.8.7/3.6Wbeta7-srambox) with ESMTP id XAA12715
-- 	for <sawada@srasva.sra.co.jp>; Sat, 13 Nov 1999 23:18:54 +0859 (JST)
-- Received: from sraigw.sra.co.jp (sraigw-hub [133.137.8.14])
-- 	by sranha.sra.co.jp (8.8.7/3.6Wbeta7-sranha) with ESMTP id XAA28689
-- 	for <sawada@sra.co.jp>; Sat, 13 Nov 1999 23:19:12 +0900 (JST)
-- Received: from mail.jaist.ac.jp (mex.jaist.ac.jp [150.65.7.20])
-- 	by sraigw.sra.co.jp (8.8.7/3.7W-sraigw) with ESMTP id XAA08011
-- 	for <sawada@sra.co.jp>; Sat, 13 Nov 1999 23:19:06 +0900 (JST)
-- Received: from localhost (jaist-gate24 [150.65.30.54]) by mail.jaist.ac.jp (3.7W-jaist_mail) with ESMTP id XAA10082; Sat, 13 Nov 1999 23:19:04 +0900 (JST)
-- To: sawada@sra.co.jp, Akishi.Seo@unisys.co.jp
-- Subject: ICSE paper
-- Message-Id: <19991113232053T.amori@jaist.ac.jp>
-- Date: Sat, 13 Nov 1999 23:20:53 +0900
-- From: Akira Mori <amori@jaist.ac.jp>
-- X-Dispatcher: imput version 980905(IM100)
-- Mime-Version: 1.0
-- Lines: 62
-- Content-Type: Text/plain; charset=iso-2022-jp
-- Content-Length: 2121

-- $B_7ED$5$s!$@%Hx$5$s$46lO+$5$^$G$7$?!%(B

-- ICSE'2000 $B$NO@J8$O$J$s$H$+$^$H$b$J$b$N$rDs=P$7$^$7$?!%;~4V$,$J$+$C$?$N(B
-- $B$G$-$D$+$C$?$G$9!%(B

-- $BO@J8$r(B

--   http://caraway.jaist.ac.jp/ipa/member/{icse2000.ps, icse2000.ps.gz}

-- $B$K$*$$$F$*$-$^$7$?$N$GGA$$$F8+$F2<$5$$!%%W%j%s%H%"%&%H$;$:$K$=$N$^$^%U%!(B
-- $B%$%kE>Aw$GAw$k$H$$$&2h4|E*$J$3$H$r$7$F$7$^$$$^$7$?!%$b$&$A$g$C$H$A$c$s(B
-- $B$H$7$?$+$C$?$G$9$,!$$^$"$^$"=q$-$?$$$3$H$O=q$$$?$N$G$h$7$H$7$^$9!%(B

-- To $B_7ED$5$s(B

-- $B0J2<$N%b%8%e!<%k$r%m!<%I$7$F(B sigmatch $B$7$F(B check refinement $B$9$k$H$*$+(B
-- $B$7$/$J$j$^$9!%$A$g$C$H8+$F$b$i$($^$9$+!%Mh=5$N2PMK$KEEAm8&Bg:e$GOC$9$k(B
-- $B$s$G$9$,!$$D$$$G$K%G%b$b$9$k$D$b$j$G$$$^$9!%(BCousot $B$H$+$bMh$k$h$&$J$N(B
-- $B$G!$$A$g$C$H%"%T!<%k$G$-$k$H$$$$$G$9$M!%$^$?5^$K$`$A$c$J$*4j$$$r$9$k$+(B
-- $B$bCN$l$^$;$s$,!$E,Ev$KL5;k$7$F2<$5$$!%(B

-- $B$=$l$G$O!%(B

-- $B?9(B $B>4(B
 
mod* SENDER {
  *[ Sender ]*  [ Data ]
  bop bit : Sender -> Bool
  bop val : Sender -> Data
  bop in : Data Bool Sender -> Sender
  op init : -> Sender
  var D : Data   var B : Bool   var S : Sender
  eq bit(init) = true .   -- valid initial state
  ceq val(in(D,B,S)) = D if bit(S) == B . -- new data for right ack
  ceq bit(in(D,B,S)) = not bit(S) if bit(S) == B . -- alternates bit
  bceq in(D,B,S) = S if bit(S) =/= B .  -- stays put for wrong ack
}

mod* RECEIVER {
  *[ Receiver ]*  [ Data ]
  bop bit : Receiver -> Bool
  bop val : Receiver -> Data
  bop get : Data Bool Receiver -> Receiver
  op init : -> Receiver
  var D : Data   var B : Bool   var R : Receiver
  eq bit(init) = true .   -- valid initial state
  ceq val(get(D,B,R)) = D if bit(R) =/= B . -- output value
  ceq bit(get(D,B,R)) = not bit(R) if bit(R) =/= B . -- alternates bit
  bceq get(D,B,R) = R if bit(R) == B . -- stays put for wrong bit
}


eof

CafeOBJ> sigmatch (SENDER) to (RECEIVER)
(V#1)
CafeOBJ> check refinement V#1
Error: Attempt to take the cdr of
       #<Printer Error, obj=#x200009: #<simple-error @ #x2084f7a2>>
       which is not listp.
  [condition type: simple-error]

[changing package from "COMMON-LISP-USER" to "CHAOS"]
[1] CHAOS(1): 

$Id:

