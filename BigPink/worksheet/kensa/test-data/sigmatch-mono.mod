**>
**> $BC10l$N<M$N<+F09=@.%F%9%H$N$?$a$N%b%8%e!<%k@k8@$H(B
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
--> $B%F%9%HBP>]$N%b%8%e!<%k(B : BUF
--> 
mod* BUF(X :: TRIV)
{
  *[ Buf ]*
  op init :  -> Buf 
  bop in : Elt Buf -> Buf
  bop val : Buf -> Elt
  bop out : Buf -> Buf
  bop empty? : Buf -> Bool
}

**> sigmatch $B$r5/F0(B
--> sigmatch (CONTAINER) to (BUF)
-->
sigmatch (CONTAINER) to (BUF)

-->
--> $B%F%9%HBP>]$N%b%8%e!<%k(B : CELL
--> 
mod* CELL(X :: TRIV) 
{
  *[ Cell ]*

  op init-cell : -> Cell
  bop put : Elt Cell -> Cell
  bop get : Cell -> Elt
}

**> sigmatch $B$r5/F0(B
--> sigmatch (CONTAINER) to (CELL)
-->
sigmatch (CONTAINER) to (CELL)

-->
--> $B%F%9%HBP>]$N%b%8%e!<%k(B : LIST
--> 
mod* LIST(X :: TRIV)  
{

  *[ List ]*

  op nil : -> List   
  op cons : Elt List -> List {coherent}
  bop car : List -> Elt
  bop cdr : List -> List
}

**> sigmatch $B$r5/F0(B
--> sigmatch (CONTAINER) to (LIST)
-->
sigmatch (CONTAINER) to (LIST)

-->
--> $B%F%9%HBP>]$N%b%8%e!<%k(B : QUEUE
--> 

mod* QUEUE(X :: TRIV) 
{
  *[ Queue ]*
  op empty : -> Queue 
  bop front : Queue -> Elt
  bop enq : Elt Queue -> Queue
  bop deq : Queue -> Queue
}

**> sigmatch $B$r5/F0(B
--> sigmatch (CONTAINER) to (QUEUE)
-->
sigmatch (CONTAINER) to (QUEUE)

-->
--> $B%F%9%HBP>]$N%b%8%e!<%k(B : STACK
--> 

mod* STACK(X :: TRIV) 
{
  *[ Stack ]*
  op empty : -> Stack
  bop top : Stack -> Elt
  bop push : Elt Stack -> Stack
  bop pop : Stack -> Stack
}

**> sigmatch $B$r5/F0(B
--> sigmatch (CONTAINER) to (STACK)
-->
sigmatch (CONTAINER) to (STACK)

**
eof

