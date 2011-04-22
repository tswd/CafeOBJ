**>
**> FOPL-CLAUSE $B<+F0M"F~$N8!::(B
**>
module R
{
  [E]
  pred Shaves : E E
  op Barber : -> E
  var x : E
  ax Shaves(x,x) | Shaves(Barber, x) .
  ax Shaves(Barber,x) -> ~(Shaves(x,x)) .
}

**> $B%b%8%e!<%k(B R $B$K<+F0E*$K(B FOPL-CLAUSE $B$,M"F~$5$l$F$$$k$+(B
**> $B$I$&$+$r(B, show $B%3%^%s%I$G$_$k(B.
show R .
