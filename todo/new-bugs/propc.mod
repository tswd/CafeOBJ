$BFsLZ$G$9(B

 |$B$*$7$i$;$$$?$@$$$?8=>]$r$I$&$7$F$b:F8=$9$k$3$H$,$G$-$^$;$s$G$7$?!#(B
 |$B$3$l$O$+$J$i$:5/$-$k8=>]$J$N$G$7$g$&$+!)(B
 |> PROPC> red not true .
 |> -- reduce in PROPC : (true)
 |> Error: Caught fatal error [memory may be damaged]
 |> Fast links are on: do (si::use-fast-links nil) for debugging
 |> Error signalled by CAFEOBJ-EVAL-REDUCE-PROC.

$B:F8=$G$-$^$7$?!%7kO@$+$i$$$&$H!$(BPROPC + BOOL $B$H$$$&(Bmodule$B$r$D$/$j!$$=(B
$B$3$G(B red $B$r<B9T$7$?8e$G!$(BPROPC$B$G(B red $B$r<B9T$9$k$H!$5/$3$k$h$&$G$9!%(B

$B0J2<$NNc$r8+$F2<$5$$!%0lHVL\$O$=$l<+BNLLGr$$8=>]$NJs9p$K$b$J$C$F$$$^$9!%(B
$B$3$l$r8+$k$H!$(BPROPC$B$H(BBOOL$B$r:.:_$5$;$k$N$O4m81$J$N$G$7$g$&$+!)(B

$B$=$&$G$"$l$P!$(BBOOL$B$K(BPROPC$B$N5!G=$r6&$KJz$+$;$F$7$^$$$=$l$r(BBOOL$B$H$7$F(B
PROPC$B$O$J$/$9J}$,NI$$$+$bCN$l$^$;$s$M!)(B

$B$3$N:]!$(BPROPC$B$O$$$m$s$J$H$3$m$GI,MW$K$J$k40A4$JL?BjO@M}=q$-49$(7O$G$9(B
$B$+$i!$>e$N(BBOOL$B$O40A4$J=q$-49$(7O$G$"$kI,MW$O$"$j$^$9$,!%(B

*** $B$G;O$^$k9T$O;d$N%3%a%s%H$G$9!%(B

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PROPC + BOOL> red not not B:Bool .
-- reduce in PROPC + BOOL : not (not B:Bool)
not (not B:Bool) : Bool
(0.000 sec for parse, 0 rewrites(0.390 sec), 4 matches)

*** PROPC + BOOL$B$G$O(B
***	not (not B:Bool) $B$O(B B:Bool$B$K4JLs$G$-$J$$!%(B
*** $B$=$NM}M3$O0J2<$NDL$j!%(B

PROPC + BOOL> sh sort Prop
Sort Prop declared in the module PROPC
  - subsort relations :
  
         ?Prop    
           |       
         Prop     
       /        \  
  Identifier  Bool
                   
  
PROPC + BOOL> sh op not_
.............................(not _).............................
  * rank: Prop -> Prop
    - attributes:  { strat: (0 1) prec: 53 }
    - axioms:
      eq not p:Prop = p:Prop xor true
  * rank: Bool -> Bool
    - attributes:  { prec: 53 }
    - axioms:
      eq not true = false
      eq not false = true

PROPC + BOOL> select PROPC
PROPC> red not not B:Bool .
-- reduce in PROPC : ((B:Bool))

*** $B$3$l$O(B B:Bool$B$K4JLs$G$-$k$O$:!$$7$+$70J2<$N$h$&$K%7%9%F%`$OK=Av$9(B
*** $B$k!%(B

Error: Caught fatal error [memory may be damaged]
Fast links are on: do (si::use-fast-links nil) for debugging
Error signalled by CAFEOBJ-EVAL-REDUCE-PROC.
Broken at PERFORM-REDUCTION.  Type :H for Help.
CHAOS>>


*** $B<B$O$3$l0J2<$N$h$&$K$b$C$H4JC1$JNc$G:F8=$5$l$k!%(B

             -- CafeOBJ system Version 1.4.2(b1) --
                built: 1998 Jul 1 Wed 10:59:03 GMT
                      prelude file: std.bin
                               ***
                   1998 Jul 2 Thu 12:15:23 GMT
                         Type ? for help
                               ---
                   uses GCL (GNU Common Lisp)
            Licensed under GNU Public Library License
              Contains Enhancements by W. Schelter
CafeOBJ> select (PROPC + BOOL)
_*
PROPC + BOOL> red not true .
-- reduce in PROPC + BOOL : not true
false : Bool
(0.000 sec for parse, 1 rewrites(0.020 sec), 1 matches)
PROPC + BOOL> select PROPC
PROPC> red not true .
-- reduce in PROPC : (true)
Error: Caught fatal error [memory may be damaged]
Fast links are on: do (si::use-fast-links nil) for debugging
Error signalled by CAFEOBJ-EVAL-REDUCE-PROC.
Broken at PERFORM-REDUCTION.  Type :H for Help.
CHAOS>>

*** $B0J>e(B



















 |
 |$B$3$N9`$NI>2A$O(B PROPC $B$G$N4JLs$GF|>oE*$K=P8=$9$k$b$N$G!"C1=c$J(B
 |$B%P%0$H$O$H$F$b;W$($^$;$s!#(B
 |$B%H%C%W%l%Y%k$N%9%$%C%A$N@_Dj$d!"(B`red not true' $B$r<B9T$9$kA0$K(B
 |$B2?$r9T$J$C$?$+$K1F6A$5$l$F$$$k2DG=@-$,$"$j$^$9$N$G!"?=$7Lu$"$j$^$;$s$,!"(B
 |$B$*D4$Y$K$J$l$kHO0O$G>pJs$r$*CN$i$;$$$?$@$1$l$P9,$$$G$9!#(B
 |$B$"$H!"$9$_$^$;$s$,%$%s%?%W%j%?$N%P!<%8%g%s$b$*CN$i$;$/$@$5$$!#(B
 |-- sawada@sra.co.jp
 |
