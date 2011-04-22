**>
**> $BN>LO5<4X78;n83(B-1: $B8xM}$N<+F0@8@.(B
**> 

**> _=*=_ $B$,9gF14X78$K$J$k%1!<%9(B
**> $B8xM}$,<+F0@8@.$5$l$F$$$J$1$l$P$J$i$J$$!%(B

mod* BISIM-AX-1 (X :: TRIV) 
{
  *[ H ]*
  op method : Elt H -> H
  bop a1 : H Elt -> Elt
  bop a2 : H Elt Elt -> Elt
  bop a3 : Elt H -> Elt
  bop a4 : Elt H -> Elt
}

**> $B%7%9%F%`$O(B _=*=_ $B$,(B congruence $B$G$"$k$H%a%C%;!<%8$r=P$7$F$$$k$O$:!%(B
**> $B<B:]$K8xM}$,DI2C$5$l$F$$$k$+$I$&$+$r(B show $B%3%^%s%I$GD4$Y$k!%(B
show BISIM-AX-1

**> $B<!$NNc$O(B _=*=_ $B$,9gF14X78$K$O$J$i$J$$%1!<%9(B
**> $B8xM}$NDI2C$,$"$C$F$O$J$i$J$$!%(B

mod* BISIM-AX-2 (X :: TRIV) 
{
  
  *[ H ]*

  op zero : -> Elt
  op empty :  -> H 
  -- $B%a%=%C%I(B
  bop put : Elt H -> H    -- method 
  bop take : Elt H -> H   -- method
  -- $B%"%H%j%S%e!<%H(B
  bop get : H Elt -> Elt    -- attribute

  vars E E' : Elt
  var B : H 

  eq get(empty, E) = zero .
  cq get(put(E, B), E')  =  get(B, E')   if E =/= E' .
  eq get(put(E, B), E)   = get(B, E) . 
  cq get(take(E, B), E') =  get(B, E')   if E =/= E' .
  eq get(take(E, B), E)  = get(B, E) .
}

**> show $B$G3NG'$9$k!%(B
show BISIM-AX-2
