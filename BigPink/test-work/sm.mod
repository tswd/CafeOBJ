-- $B$H$j$"$($:!$%7%0%M%A%c%^%C%A%s%0$G8!:w$,$G$-$k$3$H$rEvLL$NL\I8$H$7$F!$(B
-- $BE,Ev$J;EMM(B(The Alternating Bit Protocol)$B$N%U%!%$%k$rE:IU$7$^$9!%O@J8$K(B
-- $B=q$/M=Dj$NNc$b4pK\E*$K$O(B ABP $B$NJQ7A$r9M$($F$$$^$9!%Nc$($P!$(B

--   SENDER $B$N;EMM$G%7%0%M%A%c%^%C%A%s%0$9$k$H(B RECEIVER $B$b$R$C$+$+$C$F$7(B
--   $B$^$&$,!$(BABP $B$,@5>o$K0lMFNL%P%C%U%!(B BUF $B$H$7$FF0$/$?$a$K$O!$?6Iq>\:Y(B
--   $B2=$N8!>Z$r9T$&I,MW$,$"$k!%(B

-- $B$N$h$&$J%7%J%j%*$,9M$($i$l$^$9!%(B

-- ABP $B%b%8%e!<%k$O(B SENDER $B$H(B RECEIVER $B$G%Q%i%a!<%?2=$5$l$F$$$^$9$N$G!$%H(B
-- $B%l!<%@!<$X$N:G=i$NF~NO$H$7$F$3$N(B ABP $B$,M?$($i$l$k$H$$$&$3$H$b9M$($i$l(B
-- $B$^$9!%$3$N>l9g$O;EMM=q$K$b$"$k$h$&$K!$%H%l!<%@!<$NJ}$G%Q%i%a!<%?It$r@Z(B
-- $B$j=P$7$F!$(BSENDER $B$H(B RECEIVER $B$N8!:w$r9T$&$h$&$K$7$J$1$l$P$J$j$^$;$s!%(B
-- $B$3$N$"$?$j$O$^$?MM;R$r8+$FAjCL!?7hDj$7$^$7$g$&!%(B

-- $B$"$H;W$$IU$$$?$3$H$G$9$,!$1s3V<B9T$9$k:]$K$O(B CafeOBJ $B$N?6Iq;EMM$N%$%s(B
-- $B%?!<%U%'!<%9(B($B%a%=%C%I!$%"%H%j%S%e!<%H(B)$B$H(B IDL$B%$%s%?!<%U%'!<%9$NBP1~$,I,(B
-- $BMW$K$J$j$^$9!%$3$l$O>-MhE*$K3+H/$9$kM=Dj$N(B CafeOBJ->IDL$B%3%s%Q%$%i$,LL(B
-- $BE]8+$k$3$H$G$9$,!$<B83CJ3,$G$O$4$^$+$9I,MW$,$"$j$^$9!%(B

-- $B:#2s$NO@J8$G$O1s3V<B9TIt$O6uA[$G=q$/$D$b$j$G$$$^$9$N$G!$LdBj$r@hAw$j$7(B
-- $B$F$b$$$$$N$G$9$,!$(BCafeOBJ$B;EMM$r3JG<$9$k%j%]%8%H%j$dF0E*8F$S=P$7$J$I$N(B
-- $BJ}<0$b4^$a$F$$$$%"%$%G%#%"$,$"$l$P65$($F2<$5$$!%(B

-- $B%H%l!<%@!<;EMM=q$O$*$$$*$$99?7$7$F9T$-$^$9!%(B

-- $B$=$l$G$O$h$m$7$/$*4j$$$7$^$9!%(B

-- $B$=$&$=$&!$@%Hx$5$s$O(B JAIST $B$KMh$l$=$&$G$9$+!)(B $B%@%a$J$h$&$G$7$?$iEl5~$G(B
-- $B_7ED$5$s$H0l=o$K:n6H$7$F$b$i$*$&$+$H;W$C$F$$$^$9!%;d$O<j0lGU$GEl5~$K9T(B
-- $B$1$=$&$K$J$$$G$9!%(B

-- $B?9(B $B>4(B

-- ----------------------------------------------------------------------
mod* DATA {
  protecting (NAT)
  protecting (FOPL-CLAUSE)
  [ Nat < Data, Flag]
  ops on off : -> Flag { constr }
  op not_ : Flag -> Flag
  eq not on = off .
  eq not off = on .
  ax ~(on = off) .
}

mod! QUEUE {
  protecting(DATA)
  [ NeQueue < Queue ]
  op nil : -> Queue 
  op front : NeQueue -> Data
  op enq : Data Queue -> NeQueue
  op deq : NeQueue -> Queue
  vars D E : Data   var Q : Queue
  eq deq(enq(E,nil)) = nil .
  eq deq(enq(E,enq(D,Q))) = enq(E,deq(enq(D,Q))) .
  eq front(enq(E,nil)) = E .
  eq front(enq(E,enq(D,Q))) = front(enq(D,Q)) .
}

mod* SENDER {
  protecting(DATA)
  *[ Sender ]*
  bop bit : Sender -> Flag
  bop val : Sender -> Data
  bop in : Data Flag Sender -> Sender
  op init : -> Sender
  var D : Data   var B : Flag   var S : Sender
  eq bit(init) = on .   -- valid initial state
  ceq val(in(D,B,S)) = D if bit(S) == B . -- new data for right ack
  ceq bit(in(D,B,S)) = not bit(S) if bit(S) == B . -- alternates bit
  bceq in(D,B,S) = S if bit(S) =/= B .  -- stays put for wrong ack
}

mod* RECEIVER {
  protecting(DATA)
  *[ Receiver ]*
  bop bit : Receiver -> Flag
  bop val : Receiver -> Data
  bop get : Data Flag Receiver -> Receiver
  op init : -> Receiver
  var D : Data   var B : Flag   var R : Receiver
  eq bit(init) = on .   -- valid initial state
  ceq val(get(D,B,R)) = D if bit(R) =/= B . -- output value
  ceq bit(get(D,B,R)) = not bit(R) if bit(R) =/= B . -- alternates bit
  bceq get(D,B,R) = R if bit(R) == B . -- stays put for wrong bit
}

mod* ABP (X :: SENDER, Y :: RECEIVER) {
  protecting(QUEUE)
  *[ Abp ]*
  op Init : -> Abp
  op Protocol : Sender Receiver Queue Queue Queue -> Abp {coherent}
  bop In : Data Abp -> Abp
  bop Out : Abp -> Abp
  bop Val : Abp -> Data
  bop Empty? : Abp -> Bool .

  vars D E : Data   var B : Flag   var A : Abp   var S : Sender
  var R : Receiver   vars L L1 L2 : Queue
  beq Init = Protocol(init,init,nil,nil,nil) .
  bceq In(D,Protocol(S,R,L1,L2,enq(B,L)))
       = Protocol(in(D,front(enq(B,L)),S),R,enq(D,L1),
                  enq(not bit(S),L2),deq(enq(B,L)))
       if bit(S) == front(enq(B,L)) .
  beq In(D,Protocol(S,R,enq(E,L1),enq(B,L2),nil))
      = Protocol(S,R,enq(E,L1),enq(B,L2),nil) .
  bceq [ 1 ] : Protocol(S,R,L1,L2,enq(B,L))
               = Protocol(S,R,L1,L2,deq(enq(B,L)))
               if bit(S) =/= front(enq(B,L)) .
  bceq Out(Protocol(S,R,enq(D,L1),enq(B,L2),L))
       = Protocol(S,get(front(enq(D,L1)),front(enq(B,L2)),R),
         deq(enq(D,L1)),deq(enq(B,L2)),enq(not bit(R),L))
       if bit(R) =/= front(enq(B,L2)) .
  bceq [ 2 ] : Protocol(S,R,enq(D,L1),enq(B,L2),L)
               = Protocol(S,R,deq(enq(D,L1)),deq(enq(B,L2)),L)
               if bit(R) == front(enq(B,L2)) .
  beq Out(Protocol(S,R,nil,nil,enq(B,L)))
      = Protocol(S,R,nil,nil,enq(B,L)) .
  beq [ 3 ] : Protocol(S,R,L1,L2,L)
              = Protocol(S,R,enq(val(S),L1),enq(bit(S),L2),L) .
  beq [ 4 ] : Protocol(S,R,L1,L2,L)
              = Protocol(S,R,L1,L2,enq(bit(R),L)) .
  eq Val(Protocol(S,R,L1,L2,L)) = val(R) .
  eq Empty?(Protocol(S,R,L1,L2,L)) = bit(S) == bit(R) .
}

mod* BUF {
  protecting(DATA)
  *[ Buf ]*
  op init :  -> Buf 
  bop in : Data Buf -> Buf
  bop val : Buf -> Data
  bop out : Buf -> Buf
  bop empty? : Buf -> Bool
  var N : Data   var B : Buf 
  eq empty?(init) = true .
  ceq empty?(out(B)) = true if not empty?(B) .
  eq empty?(in(N,B)) = false .
  ceq val(out(in(N,B))) = N if empty?(B) .
  bceq in(N,B) = B if not empty?(B) .
  bceq out(B) = B if empty?(B) .
}

module M1
{
  protecting (DATA)
  *[ E ]*
  op elt : -> E
  bop ar1 : E -> Bool
  bop ar2 : E -> Data
  bop m1  : Bool E Data -> E
}

view X1 from M1 to SENDER
{
  hsort E -> Sender,
  bop ar1 -> bit,
  bop ar2 -> val,
  bop m1(B:Bool, E:E, D:Data) -> in(X:Data, Y:Bool, S:Sender),
  op elt -> init
}

view V1 from SENDER to RECEIVER
{
  hsort Sender -> Receiver,
  bop bit -> bit,
  bop val -> val,
  var D : Data,
  var B : Bool,
  bop in(D,B,S:Sender) -> get(D,B,S:Receiver),
  op init -> init
}


--
eof
--
$Id:
