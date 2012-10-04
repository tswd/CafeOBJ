** $Id: lifsch.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** translated form examples of OTTER3.0.5 examples/lifsch.in
** begin{quote}
--  A problem from Vladimir Lifschitz
--
--  This problem was suggested as a challenge to resolution programs.
--  It is easily solved by Maslov's inverse method.
** end{quote}

module LIFSCH (E :: TRIV)
{ 
  pred p : Elt Elt
  pred q : Elt Elt
  pred s : Elt Elt
}

option reset
flag (auto,on)

open LIFSCH .
protecting (FOPL-CLAUSE)

goal \E[x:Elt, x1:Elt](\A[y:Elt](\E[z:Elt, z1:Elt]
     ( (~ p(y,y) | p(x,x)   | ~ s(z,x)) &
       ( s(x,y)  | ~ s(y,z) | q(z1,z1)) &
       ( q(x1,y) | ~ q(y,z1)| s(x1,x1)) ))) .
   
resolve .
close
--
eof
