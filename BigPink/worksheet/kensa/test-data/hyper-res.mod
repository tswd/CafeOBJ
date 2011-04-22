**>
**> Hyper Resolution $B8!::(B
**> Otter3.0.5 $B$NNcBj$r(B CafeOBJ $B$XJQ49$7$?$b$N!%(B
**> 

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

**> $B%*%W%7%g%s$N%j%;%C%H(B
option reset
**> auto $B%b!<%I$G<B9T$9$k!%(B
flag (auto,on)
**> $B>\:Y$JE}7W>pJs$r0u;z$9$k$h$&$K@_Dj$9$k!%(B
param (stats-level,4)

open WANG
**> $BH?G}%(%s%8%s$N5/F0(B
resolve .
close
--
eof
