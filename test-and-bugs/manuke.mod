-- From: Michihiro Matumoto <mitihiro@jaist.ac.jp>
-- Date: Wed, 12 Nov 97 17:33:10 JST
-- Message-Id: <9711120833.AA13090@is27e0s04.jaist.ac.jp>
-- To: cafeteria@rascal.jaist.ac.jp
-- Subject: Bug for "sort qualifying" and "red command"
-- Resent-Message-ID: <"1QgSe.A.NhF.JnWa0"@rascal.jaist.ac.jp>
-- Resent-From: cafeteria@rascal.jaist.ac.jp
-- Reply-To: cafeteria@rascal.jaist.ac.jp
-- X-Mailing-List: <cafeteria@ldl.jaist.ac.jp> archive/latest/190
-- X-Loop: cafeteria@ldl.jaist.ac.jp
-- Precedence: list
-- Resent-Sender: cafeteria-request@rascal.jaist.ac.jp
-- Content-Type: text
-- Content-Length: 2108

-- $B>>K\(B@JAIST $B$G$9!#(B

--   CafeOBJ system Version 1.4.0(Beta-3) $B$N!"(B"sort qualifying" $B$H!"(B
-- "red command" $B$K4X$9$kIT6q9g$i$7$-8=>]$rH/8+$7$?$N$GJs9p$7$^$9!#(B

--   $B0J2<$N%3!<%I$r<B9T$7$^$9!#(B

-- vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

set auto context on .

mod! AB {
  [ A ]
  op a : -> A

  [ B ]
  op a : -> B
  op b : -> B

  eq b = a .
}

open .
red b == a:B .  --> this must be b == (a):B .

-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- $B$9$k$H!"(B

--  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

-- %AB> set trace whole on .

-- %AB> red b == a:B .
-- -- reduce in % : b == a:B
-- [1]: b == a:B
-- ---> a == a:B
-- [2]: a == a:B
-- ---> false
-- false : Bool
-- (0.000 sec for parse, 2 rewrites(0.000 sec), 2 match attempts)

-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- $B$H!"(Btrue $B$K$J$k$O$:$J$N$K!"(Bfalse $B$K$J$C$F$7$^$$$^$9!#(B
-- $B$J$*!"(Bsort qualifying $B$r$7$J$$$H!"0J2<$N$h$&$K(Btrue $B$K$J$j$^$9!#(B

-- vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
-- %AB> red b == a .
-- [Warning]: Ambiguous term:
-- * Please select a term from the followings:
-- [1] _==_ :  Cosmos   Cosmos  -> Bool --------------------------
-- _==_:Bool
--   /    \  
--  b:B  a:B
          
-- [2] _==_ :  Cosmos   Cosmos  -> Bool --------------------------
-- _==_:Bool
--   /    \  
--  b:B  a:A
          
-- * Please input your choice (a number from 1 to 2, default is 1)? 1
-- Taking the first as correct.
-- -- reduce in % : b == a
-- [1]: b == a
-- ---> a == a
-- [2]: a == a
-- ---> true
-- true : Bool
-- (1.533 sec for parse, 2 rewrites(0.000 sec), 2 match attempts)

-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- $BC"$7!"(Bsort qualifying $B$7$J$$>l9g!"(BAmbiguous term: $B$NA*Br$G(B[2]$B$r;XDj(B
-- $B$7$?;~$b!"(Btrue $B$K$J$C$F$7$^$$$^$9!#(B
-- $B$3$A$i$N%1!<%9$O!"(Bsort $B$,0c$&$N$G!"(Bfalse$B$K$J$k$O$:$@$H;W$&$N$G$9$,!"(B
-- $B0c$&$N$G$7$g$&$+!)(B

-- -- 
-- $BKLN&@hC<2J3X5;=QBg3X1!Bg3X(B $B>pJs2J3X8&5f2J(B $B>pJs%7%9%F%`3X@l96(B
-- $B8@8l@_7W3X9V:B(B $BFsLZ8&5f<<(B $BGn;NA04|2]Dx(B 2$BG/(B
-- $B>>K\(B $B=<9-(B mitihiro@jaist.ac.jp

