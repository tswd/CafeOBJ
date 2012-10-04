** $Id: wang1.mod,v 1.1.1.1 2003-06-19 08:30:08 sawada Exp $
** translated from otter3.0.5 examples/auto/wang1.in
** begin{quote}
-- This is the Wang exq1 problem
** end{quote}

module! WANG
{ 
  protecting (FOPL-CLAUSE)
  [ E ]

  ops m b k : -> E
  pred p : E E
  ops f g : E -> E

  vars x y z v v1 : E

  ax y = m | p(y,m) | v1 = m | v1 = y | ~ p(y,v1) | ~ p(v1,y).
  ax y = b | ~ p(y,b) | v = b | v = y | ~ p(y,v) | ~ p(v,y).
  ax y = k | y = m | y = b | ~ p(y,k).
  ax y = m | ~ p(y,m) | ~(f(y) = m) .
  ax y = m | ~ p(y,m) | ~(f(y) = y) .
  ax y = m | ~ p(y,m) | p(y,f(y)).
  ax y = m | ~ p(y,m) | p(f(y),y).
  ax y = b | ~ p(y,b) | ~(g(y) = b) .
  ax y = b | p(y,b) | ~(g(y) = y) .
  ax y = b | p(y,b) | p(y,g(y)).
  ax y = b | p(y,b) | p(g(y),y).
  ax y = k | ~(y = m) | p(y,k).
  ax y = k | ~(y = b) | p(y,k).
  ax x = x .
  ax ~(x = y) | y = x .
  ax ~(x = y) | ~(y = z) | x = z .
  ax ~(x = y) | ~ p(x,z) | p(y,z).
  ax ~(x = y) | ~ p(z,x) | p(z,y).
  ax ~(x = y) | f(x) = f(y).
  ax ~(x = y) | g(x) = g(y).
  **

  ax ~(m = b).
  ax ~(b = k).
  ax ~(k = m).
}

option reset
flag (auto,on)
-- flag(print-kept,on)
param (stats-level,4)
-- flag (very-verbose,on)

open WANG .
resolve .
close .
--
eof .
