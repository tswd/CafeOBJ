**>
**> $B8xM}$N@a7A<0$X$N<+F0JQ498!::(B
**> 

set include FOPL-CLAUSE on

module R
{

  [E]
  pred Shaves : E E
  op Barber : -> E
  var x : E
  ax[ax1]: Shaves(x,x) | Shaves(Barber, x) .
  ax[ax2]: Shaves(Barber,x) -> ~(Shaves(x,x)) .
}

option reset

**> $B%b%8%e!<%k(B R $BJ8L.%b%8%e!<%k$K@_Dj$9$k(B
--> select R
select R

**> $BH?G}%7%9%F%`$N=i4|2=(B
--> db reset
db reset

**> $B<+F0JQ49$5$l$F$$$k$O$:$N@a=89g$r8+$k(B
--> list axioms
list axioms


