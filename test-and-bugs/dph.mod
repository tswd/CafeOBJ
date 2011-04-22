-- To: sawada@sra.co.jp
-- From: Eiko Matsushima <Eiko.Matsushima@unisys.co.jp>
-- Subject: DINNING FILOSOPHER
-- Date: Mon, 20 Oct 1997 11:51:34 +0900
-- Sender: matusima@as.unisys.co.jp
-- Content-Type: text
-- Content-Length: 7368

-- $B$3$s$K$A$O!">>Eg!w%f%K%7%9$G$9!#(B

-- CafeOBJ 1.3.1(Roman)$B$G(Bmodule$B$N(Bdefining$B$G%(%i!<$K$J$k(B
-- $B!V?);v$9$kE/3X<T!W$N%5%s%W%k$r$*Aw$jCW$7$^$9!#(B
-- 1.3.1, CafeOBJ 1.3.1b$B$G$O(BOK$B$G$9!#(B1.4$B$G$O;n$7$F$$$^$;$s!#(B
-- $B$4B8CN$+$H;W$$$^$9$,!"(BCafeOBJ$B%$%s%?%W%j%?$N%5%s%W%k$K(B
-- $B$D$$$F$$$k(B exs/fun.mod $B$b(B1.3.1(Roman)$B$G%(%i!<$K$J$j$^$9!#(B

-- ===8< cut here 8<====

-- $B!VB?AjE*$J!W6u=89g(B

module EMPTY { [ Empty ] op * : -> Empty }

-- $BMWAG$N=EJ#$r5v$9!"=89g(B
-- _,_ $B$O=89g$NOB$G!"7k9gE*!"2D49!"C10L85$O6u=89g(B

module MULTISET[X :: TRIV] {
  protecting (EMPTY)
  signature {
    [ Empty Elt < MultiSet ]
    op _,_ : MultiSet MultiSet -> MultiSet { assoc comm id: * }
  }
}

-- $B%W%m%;%9$N%A%c%M%k$NL>A0(B
-- _[_:=_] $B$O!"L>A0$NCf$G<+M3$JJQ?t$KBP$7$FL>A0$rBeF~$9$k1i;;(B

module NAME {
  signature {
    [ Variable < Primitive < Name ]
    op _[_] : Name Name -> Name
    op _[_:=_] : Name Variable Name -> Name
  }
  axioms {
    var X : Variable
    var P : Primitive
    vars L M N : Name
    cq P[X := N] = N if P == X .
    cq P[X := N] = P if not(P == X) .
    eq L[M][X := N] = L[X := N][M[X := N]] .
  }
}

-- $B%W%m%;%9$N%A%c%M%k(B
-- ? $B$OF~NO$rI=$7!"(B! $B$O=PNO$rI=$9(B

module CHANNEL {
  protecting (NAME)
  signature {
    [ Channel ]
    ops ? ! : Name -> Channel
    op _[_:=_] : Channel Variable Name -> Channel
  }
  axioms {
    var X : Variable
    vars M N : Name
    eq ?(M)[X := N] = ?(M[X := N]) .
    eq !(M)[X := N] = !(M[X := N]) .
  }
}

view TRIV2CHANNEL from TRIV to CHANNEL { sort Elt -> Channel }

-- $B%A%c%M%k$NB?=E=89g(B

module CHANNELS {
  protecting ((MULTISET * { sort MultiSet -> Channels })[TRIV2CHANNEL])
  signature {
    op _[_:=_] : Channels Variable Name -> Channels
  }
  axioms {
    var N : Name
    var X : Variable
    var C : Channel
    var Cs : Channels
    eq *[X := N] = * .
    cq (C,Cs)[X := N] = (C[X := N]),(Cs[X := N]) if not(Cs == *) .
  }
}

-- $B%W%m%;%9(B
-- {Cs}; P $B$O!"%A%c%M%k$?$A(B Cs $B$G%,!<%I$5$l$F$$$k%W%m%;%9(B P $B$rI=$9(B

module PROCESS {
  protecting (CHANNELS)
  signature {
    [ Unit < Process ]
    op @ : -> Unit
    op {_};_ : Channels Process -> Process
    op _[_:=_] : Process Variable Name -> Process
  }
  axioms {
    var N : Name
    var X : Variable
    var U : Unit
    var P : Process
    var Cs : Channels
    eq {*}; @ = @ .
    eq {*};({Cs}; P) = {Cs}; P .
    eq U[X := N] = U .
    eq ({Cs}; P)[X := N] = {Cs[X := N]};(P[X := N]) .
  }
}

-- $B%W%m%;%9$NJB9T9g@.(B
-- $B=q49$(5,B'$G!"JB9T9g@.$5$l$F$$$k%W%m%;%94V$N8r?.$rI=$7$F$$$k(B

module COMPOSITION {
  extending (PROCESS)
  signature {
    op _|_ : Process Process -> Process { assoc comm id: @ }
  }
  axioms {
    var X : Variable
    vars M N : Name
    vars Cs Ds : Channels
    vars P Q R : Process
    rl  ({!(N),Cs}; P)|({?(N),Ds}; Q) => ({Cs}; P)|({Ds}; Q) .
    rl  ({!(M[N]),Cs}; P)|({?(M[X]),Ds}; Q) => ({Cs}; P)|({Ds};(Q[X := N])) .
    crl ({!(N),Cs}; P)|({?(N),Ds}; Q)| R =>
        ({Cs}; P)|({Ds}; Q)| R if not(R == @) .
    crl ({!(M[N]),Cs}; P)|({?(M[X]),Ds}; Q)| R =>
        ({Cs}; P)|({Ds};(Q[X := N]))| R if not(R == @) .
    cq  (P | Q)[X := N] = (P[X := N])|(Q[X := N]) if not(P == @ or Q == @).
  }
}

-- $BNc!'?);v$9$kE/3X<T$?$A(B

-- $BE/3X<T$N?M?t(B($B:GBg(B4$B?M(B)
-- $BM}M3!'(B4$B?M$rD6$($k$H!"<B9T$K0lF|$+$+$k$+$i(B

module NUMBER { [ Num ] ops 1 2 3 4 : -> Num }

-- $B%U%)!<%/$KBP$9$k9T0Y(B($B!V;}$D!W$H!VCV$/!W(B)

module ACTION-on-FORK {
  extending (NAME)
  signature {
    ops pickup putdown : -> Primitive
  }
}

-- $B%U%)!<%/$rI=$9%W%m%;%9(B
-- $BC/$+$K;}$?$l$?$i!"$=$N?M$,CV$/$^$G!"C/$b;H$($J$$(B

module FORK {
  extending (PROCESS)
  extending (ACTION-on-FORK)
  signature {
    op x : -> Variable
    op FK : -> Unit
    op fk : -> Process
  }
  axioms {
    var X : Variable
    var N : Name
    eq fk = {?(pickup[x])};{?(putdown[x])}; FK .
    eq {*}; FK = fk .
  }
}

-- $B0X;R$KBP$9$k9T0Y(B($B!V:B$k!W$H!VN)$D!W(B)

module ACTION-on-SEAT {
  extending (NAME)
  signature {
    ops sitdown getup : -> Primitive
  }
}

-- $B0X;R$rI=$9%W%m%;%9(B
-- $BC/$+$K:B$i$l$?$i!"$=$N?M$,N)$D$^$G$OC/$b:B$l$J$$(B

module SEAT {
  extending (PROCESS)
  extending (ACTION-on-SEAT)
  signature {
    op y : -> Variable
    op ST : -> Unit
    op st : -> Process
  }
  axioms {
    var X : Variable
    var N : Name
    eq st = {?(sitdown[y])};{?(getup[y])}; ST .
    eq {*}; ST = st .
  }
}

-- $BE/3X<T$rI=$9%W%m%;%9(B
-- $B@J$K$D$$$F!"%U%)!<%/$rFs$D;}$A%9%Q%2%F%#$r?)$Y$k(B
-- $B%9%Q%2%F%#$r?)$Y=*$($?$i!"%U%)!<%/$rCV$-!"@J$rN%$l$k(B
-- $B$?$@$7!"$3$NE/3X<T$O?5$_?<$/$J$/(B
-- $B6u$$$F$$$k@J$J$i$P2?=h$K$G$b:B$j(B
-- $B6u$$$F$$$k%U%)!<%/$J$i$P!"$?$H$(<+J,$+$iN%$l$F$$$F$b<h$j$K9T$/(B

module PHILOSOPHER {
  extending (PROCESS)
  extending (ACTION-on-FORK)
  extending (ACTION-on-SEAT)
  protecting (NUMBER)
  signature {
    [ Num < Primitive ]
    op PH : -> Unit
    op ph : Num -> Process
  }
  axioms {
    var i : Num
    eq ph(i) = {!(sitdown[i])};
               {!(pickup[i]),!(pickup[i])};
               {!(putdown[i]),!(putdown[i])};
               {!(getup[i])}; PH .
  }
}

-- $B?)F2(B
-- $B%"%$%F%`$O!"%U%)!<%/!"@J!"$=$7$FE/3X<T(B

module DININGROOM {
  extending (COMPOSITION)
  extending (FORK)
  extending (SEAT)
  extending (PHILOSOPHER)
}

-- $B<B9TNc(B
-- $BE/3X<T!"%U%)!<%/!"@J$N?t$O$=$l$>$l(B 3
-- $BE/3X<T$O4{$K@J$KCe$$$F$$$k(B
-- $BE/3X<T$?$A$,%9%Q%2%F%#$r?)$Y$k$Y$/!"0l@F(B(?)$B$K%U%)!<%/$r;}$H$&$H$9$k$H(B...

open DININGROOM .
op sph : Num -> Process .
var j : Num .
eq sph(j) = ph(j) | st .
let droom = fk | fk | fk | sph(1) | sph(2) | sph(3) .
reduce droom .

-- $B<!$N$h$&$J7k2L$K=*$o$k(B
-- $BE/3X<T$O(B1$BK\$:$D%U%)!<%/$r;}$A!"B>$NE/3X<T$N%U%)!<%/$rbK$s$G$$$k(B
-- $BE/3X<T$O%U%)!<%/$,(B2$BK\;}$F$J$$$+$i!"%9%Q%2%F%#$r?)$Y$i$l$J$$(B

--   {!(pickup[3])};{!(putdown[3]),!(putdown[3])};{!(getup[3])}; PH
-- | {?(putdown[3])}; FK
-- | {!(pickup[2])};{!(putdown[2]),!(putdown[2])};{!(getup[2])}; PH
-- | {?(putdown[2])}; FK
-- | {!(pickup[1])};{!(putdown[1]),!(putdown[1])};{!(getup[1])}; PH
-- | {?(putdown[1])}; FK
-- | {?(getup[1])}; ST
-- | {?(getup[2])}; ST
-- | {?(getup[3])}; ST
-- : Process
-- (0.000 sec for parse, 207 rewrites(37.150 sec), 632 match attempts)
close

-- $B:#EY$O!"@J$r0l$D>/$J$/$9$k(B
-- $BE/3X<T$N0l?M$O!"C/$+$,?)$Y=*$o$k$^$G!"@J$KCe$/$3$H$O$G$-$J$$(B

open DININGROOM .
let droom = fk | fk | fk | ph(1) | ph(2) | ph(3) | st | st .
reduce droom .

-- $B:#EY$O!"L5;v$KE/3X<TA40w$,?);v$r=*$($k$3$H$,$G$-$?(B

--   {*}; PH
-- | {?(sitdown[y])};{?(getup[y])}; ST
-- | {?(sitdown[y])};{?(getup[y])}; ST
-- | {*}; PH
-- | {*}; PH
-- | {?(pickup[x])};{?(putdown[x])}; FK
-- | {?(pickup[x])};{?(putdown[x])}; FK
-- | {?(pickup[x])};{?(putdown[x])}; FK
-- : Process
-- (0.000 sec for parse, 332 rewrites(46.533 sec), 1175 match attempts)
close

-- $BK\Ev$O(B
-- let droom = fk | fk | fk | ph(1) | ph(2) | ph(3) | st | st | st .
-- $B$H$7$F!"(Bdroom $B$NCM$r7W;;$9$k$H(B deadlock $B$K$J$k$3$H$r8+$?$$$s$@$1$l$I!"(B
-- Cafe$B$N<B9T$NJJ$N$;$$$+!"$=$&$9$k$HE/3X<T$,A40w?);v$G$-$F$7$^$&!#(B
-- $BA40w$,@J$K$D$$$F0l@F$K%U%)!<%/$r;}$H$&$H$9$k$H!":G=i$N<B9T$N$h$&$K(B
-- deadlock $B$K$J$k$3$H$r!"(Bapply $B%3%^%s%I$r;H$C$F8+$;$i$l$k$H;W$$$^$9!#(B

-- ===8< cut here 8<====
