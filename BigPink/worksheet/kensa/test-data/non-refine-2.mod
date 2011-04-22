**>
**> $B;EMM>\:Y2=8!::!'>\:Y2=$H$J$C$F$$$J$$>l9g(B
**> sigmatch $B$K$h$k<+F09=@.<M$K$h$k8!::!'(B
**>

**>
**> CONTAINER : $B%Y!<%9$H$9$k;EMM(B
**> $B0lHLE*$J!VF~$lJ*!W$rDj5A$7$?%b%8%e!<%k(B
**>
mod* CONTAINER(X :: TRIV) 
{
  *[ Container ]*

  op empty : -> Container
  bop store : Elt Container -> Container
  bop val : Container -> Elt

  var E : Elt
  var C : Container

  eq val(store(E,C)) = E .
}

**>
**> Buufer $B9=B$(B
**>
mod* BUF(X :: TRIV)
{
  *[ Buf ]*
  op init :  -> Buf 
  bop in : Elt Buf -> Buf
  bop val : Buf -> Elt
  bop out : Buf -> Buf
  bop empty? : Buf -> Bool
  var N : Elt   var B : Buf 
  eq empty?(init) = true .
  ceq empty?(out(B)) = true if not empty?(B) .
  eq empty?(in(N,B)) = false .
  ceq val(out(in(N,B))) = N if empty?(B) .
  bceq in(N,B) = B if not empty?(B) .
  bceq out(B) = B if empty?(B) .
}

**>
**> QUEUE $B9=B$(B
**>
mod* QUEUE(X :: TRIV) 
{
  *[ Queue ]*
  op empty : -> Queue 
  bop front : Queue -> Elt
  bop enq : Elt Queue -> Queue
  bop deq : Queue -> Queue
  vars D E : Elt   var Q : Queue
  beq deq(enq(E,empty)) = empty .
  beq deq(enq(E,enq(D,Q))) = enq(E,deq(enq(D,Q))) .
  eq front(enq(E,empty)) = E .
  eq front(enq(E,enq(D,Q))) = front(enq(D,Q)) .
}

**> $B3F!9$N%b%8%e!<%k$K$D$$$F!"(BCONTAINER $B$+$i$N(B
**> $B<M$r@8@.$9$k!'(B

--> sigmatch (CONTAINER) to (BUF)
-->
sigmatch (CONTAINER) to (BUF)

--> sigmatch (CONTAINER) to (QUEUE)
-->
sigmatch (CONTAINER) to (QUEUE)



