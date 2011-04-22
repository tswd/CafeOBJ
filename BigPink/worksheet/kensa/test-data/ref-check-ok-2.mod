**>
**> $B;EMM>\:Y2=8!::$N;n83(B - 2
**> $B<+F0@8@.$5$l$?<M$K$h$k>l9g!%(B
**>

**> $B$b$H$K$J$k;EMM!'(BCONTAINER
**> $B0lHLE*$J!VF~$lJ*!W$rDj5A$7$?%b%8%e!<%k(B
**>
mod* CONTAINER(X :: TRIV) 
{
  *[ Container ]*

  -- $B6u$NF~$lJ*(B
  op empty : -> Container
  -- $BMWAG$rF~$l$k(B
  bop store : Elt Container -> Container
  -- $BF~$lJ*$NCf$r8+$k(B
  bop val : Container -> Elt

  var E : Elt
  var C : Container
  -- $BMWAG(BE$B$r3JG<$7$?D>8e$KCf$r8+$k$H(BE$B$,8+$($k(B
  eq val(store(E,C)) = E .
}

**>
**> CELL : CONTAINER $B$HF1$8$/0lHLE*$JF~$lJ*(B
**>
mod* CELL(X :: TRIV) 
{
  *[ Cell ]*

  op init-cell : -> Cell
  bop put : Elt Cell -> Cell
  bop get : Cell -> Elt

  var E : Elt
  var C : Cell

  eq get(put(E,C)) = E .
}

**>
**> STACK : $B@hF~$l@h$@$7J}<0$NF~$lJ*(B
**>
mod* STACK(X :: TRIV) 
{
  *[ Stack ]*
  op empty : -> Stack
  bop top : Stack -> Elt
  bop push : Elt Stack -> Stack
  bop pop : Stack -> Stack
  vars D : Elt   var S : Stack
  eq pop(empty) = empty .
  eq top(push(D,S)) = D .
  beq pop(push(D,S)) = S .
}

**>
**> LIST : $B%j%9%H9=B$(B
**>
mod* LIST(X :: TRIV)  {

  *[ List ]*

  op nil : -> List   
  op cons : Elt List -> List {coherent}
  bop car : List -> Elt
  bop cdr : List -> List
    
  vars E E' : Elt
  var L : List

  eq car(cons(E, L)) = E .
  beq cdr(nil) = nil .
  beq cdr(cons(E, L)) = L .
}

**> $B$=$l$>$l$N%b%8%e!<%k$K$D$$$F!$(BCONTAINER $B$H$N(B sigmatch $B$r(B
**> $B<B9T$7$F!$<M$r<+F0@8@.$9$k!%(B

--> sigmatch (CONTAINER) to (CELL)
-->
sigmatch (CONTAINER) to (CELL)

--> sigmatch (CONTAINER) to (STACK)
-->
sigmatch (CONTAINER) to (STACK)

--> sigmatch (CONTAINER) to (LIST)
-->
sigmatch (CONTAINER) to (LIST)

