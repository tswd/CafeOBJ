**>
**> $BJ#?t$N<M$N<+F09=@.%F%9%H$N$?$a$N%b%8%e!<%k@k8@$H(B
**> sigmatch $B%3%^%s%I$N5/F0(B
**>

-->
--> $B%Y!<%9$H$J$k%b%8%e!<%k(B $B!'(B CONTAINER
-->

mod* CONTAINER(X :: TRIV) 
{
  *[ Container ]*

  op empty : -> Container
  bop store : Elt Container -> Container
  bop val : Container -> Elt
}

-->
--> $B%F%9%HBP>]$N%b%8%e!<%k(B : MTEST
--> 
mod* MTEST(X :: TRIV)
{
  *[ H ]*

  op init : -> H
  bop m1   : H Elt -> H
  bop m2   : Elt H -> H
  bop a1   : H -> Elt
  bop a2   : H -> Elt
}

**> sigmatch $B%3%^%s%I$N5/F0(B
--> sigmatch (CONTAINER) to (MTEST)
-->
sigmatch (CONTAINER) to (MTEST)

