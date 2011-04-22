**>
**> $B<M$,L5$$>l9g$N%F%9%H$N$?$a$N%b%8%e!<%k@k8@$H(B
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
--> $B%F%9%HBP>]$N%b%8%e!<%k(B : ARR
--> 
mod* ARR(X :: TRIV) 
{
  protecting(NAT)
  *[ Arr ]*
  op nil : -> Arr
  bop put : Elt Nat Arr -> Arr
  bop  _[_] : Arr Nat -> Elt
}

**> sigmatch $B$r5/F0(B
--> sigmatch (CONTAINER) to (ARR)
-->
sigmatch (CONTAINER) to (ARR)

-->
--> $B%F%9%HBP>]$N%b%8%e!<%k(B : BAG
--> 
mod* BAG(X :: TRIV) 
{

  protecting(NAT)
  *[ Bag ]*
  op empty :  -> Bag 
  bop put : Elt Bag -> Bag
  bop take : Elt Bag -> Bag
  bop get : Bag Elt -> Nat
}

**> sigmatch $B$r5/F0(B
--> sigmatch (CONTAINER) to (BAG)
-->
sigmatch (CONTAINER) to (BAG)

-->
--> $B%F%9%HBP>]$N%b%8%e!<%k(B : COUNTER
--> 
mod* COUNTER {
  protecting(INT)

  *[ Counter ]*

  op init : -> Counter
  bop add : Int Counter -> Counter
  bop read_ : Counter -> Int
}

**> sigmatch $B$r5/F0(B
--> sigmatch (CONTAINER) to (COUNTER)
-->
sigmatch (CONTAINER) to (COUNTER)

-->
--> $B%F%9%HBP>]$N%b%8%e!<%k(B : BASICSETS
--> 

mod* BASICSETS(X :: TRIV) 
{

  *[ Set ]*

  op empty : -> Set 
  op add   : Elt Set -> Set {coherent}
  bop _in_  : Elt Set -> Bool
}

**> sigmatch $B$r5/F0(B
--> sigmatch (CONTAINER) to (BASICSETS)
-->
sigmatch (CONTAINER) to (BASICSETS)







