** $Id: x2_quant.mod,v 1.1.1.1 2003-06-19 08:30:08 sawada Exp $
** translated from otter 3.0.5 examples/auto/x2_quant.in
** begin{quote}
--  xx=e groups are commutative.
** end{quote}

module X2 (E :: TRIV)
{
  protecting (FOPL-CLAUSE)

  op _*_ : Elt Elt -> Elt

  vars x y z : Elt
  ax \A[x,y,z] (x * y) * z = x * (y * z) .

  ax \E[e:Elt] (\A[x] e * x = x) &
               (\A[x]\E[y] y * x = e) &
	       (\A[x] x * x = e) .
}

option reset
flag(auto,on)
flag(universal-symmetry,on)
flag(print-new-demod,on)
open X2
goal \A[x,y] x * y = y * x .
resolve .
close
--
eof
