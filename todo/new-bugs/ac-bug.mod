-- To: sawada@sra.co.jp
-- cc: ishisone@srapc459.sra.co.jp
-- Subject: BOOL3
-- Date: Thu, 30 Apr 1998 17:03:17 +0900
-- From: Makoto Ishisone <ishisone@srapc459.sra.co.jp>
-- Content-Type: text
-- Content-Length: 1837

-- BOOL3 $B$r;H$C$F%F%9%H$7$F$_$^$7$?!#$G!"(Bbrute $B$N9`$NEy2A@-H=Dj%k!<%A%s$K(B
-- $B%P%0$r8+$D$1$?$N$G$9$,!"$D$$$G$K%$%s%?%W%j%?$N%P%0$i$7$-$b$N$r8+$D$1$^$7$?!#(B
-- $B%$%s%?%W%j%?$O(B srapc459 $B$K%$%s%9%H!<%k$5$l$F$$$k$d$D$G$9!#(B

-- $B%b%8%e!<%k(B

mod! BOOL3 {
  [ B3 ]
  ops (_+_) (_*_) : B3 B3 -> B3 { assoc comm }
  ops 0 1 2 : -> B3
  ops and or : B3 B3 -> B3
  op not : B3 -> B3
  ops a b c d : -> B3
    
  vars X Y Z : B3

  eq X + 0 = X .
  eq X + X + X = 0 .
  eq (X + Y) * Z = (X * Z) + (Y * Z) .

  eq X * 0 = 0 .
  eq X * X * X = X .
  eq X * 1 = X .

  eq and(X,Y) = (X * X * Y * Y) + (2 * X * X * Y) +
    (2 * X * Y * Y) + (2 * X * Y) .
  eq or(X, Y) = (2 * X * X * Y * Y) + (X * X * Y) +
    (X * Y * Y) + (X * Y) + (X + Y) .
  eq not(X) = (2 * X) + 1 .
  eq 2 = 1 + 1 .
}

-- $B$K$*$$$F(B

--     red not(and(a, b)) .

-- $B$r<B9T$9$k$H!"(B

--     (a * b) + (a * b * b) + (a * b * b) + (a * a * b * b) + (a * a * b * b) + 1 : B3

-- $B$H$$$&7k2L$,F@$i$l$^$9!#$h$/8+$F$_$k$H$3$l$O(B a $B$H(B b $B$K4X$7$FHsBP>N$G$9$,!"(B
-- and/or $B$K4X$9$k8xM}$OA4$FBP>N$J$N$G$A$g$C$HJQ$G$9!#$G!"%H%l!<%9$7$F$_$k$H!"(B

-- 1>[16] rule: eq AC + X:B3 + X:B3 + X:B3 = AC + 0
--     { AC |-> (a * a * b * b) + (a * b * b) + (a * b) + (a * b), X:B3 |-> 
--        a * b * b }
-- 1<[16] (a * a * b * b) + (a * a * b) + (a * a * b) + (a * b * b) 
--     + (a * b * b) + (a * b) + (a * b) --> (a * a * b * b) + (a * 
--     b * b) + (a * b) + (a * b) + 0

-- $B$N%^%C%A%s%0$,JQ$G$9!#>e$r%3%s%Q%/%H$K=q$-D>$9$H(B

--     aabb + aab + aab + abb + abb + ab + ab

-- $B$KBP$7$F(B

--     eq X + X + X = 0 .

-- $B$,(B X = abb $B$G%^%C%A%s%0$7$F!"7k2L$,(B

--     aabb + abb + ab + ab + 0

-- $B$K$J$C$F$$$^$9!#$I$&$b(B abb $B$H(Baab $B$,Ey2A$@$H$7$F07$o$l$F$$$k$h$&$G$9!#(B

-- 							-- ishisone
eof

aabb + aab + aab + abb + abb + ab + ab
