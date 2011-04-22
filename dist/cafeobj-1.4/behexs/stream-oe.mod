** $Id: stream-oe.mod,v 1.1.1.1 2003-06-19 08:30:02 sawada Exp $
** stream
** with odd & even as cobasis
**
mod* STREAM (X :: TRIV)
{
  *[ Stream ]*
  bop head : Stream -> Elt 
  bop tail : Stream -> Stream 
  bop _&_  : Elt Stream -> Stream 
  bop even : Stream -> Stream 
  bop odd  : Stream -> Stream 
  op zip  : Stream Stream -> Stream {coherent}
  var N : Elt 
  vars S S' : Stream 
  eq head(odd(S)) = head(S) .
  eq head(tail(S)) = head(even(S)) .
  beq  odd(tail(S)) = even(S) .
  beq even(tail(S)) = tail(odd(S)) .
  eq head(N & S) = N .
  beq  odd(N & S) = N & even(S) .
  beq even(N & S) = odd(S) .
  eq head(zip(S, S')) = head(S) .
  beq  odd(zip(S, S')) = S .
  beq even(zip(S, S')) = S' .
}

set trace on
option reset
select STREAM
cbred head(N & S) == N .
cbred tail(N & S) == S .
cbred head(odd(S)) == head(S) .
cbred tail(odd(S)) == even(tail(S)) .
cbred head(even(S)) == head(tail(S)) .
cbred tail(even(S)) == even(tail(tail(S))) .
cbred head(zip(S, S')) == head(S) .
cbred tail(zip(S, S')) == zip(S', tail(S)) .

set trace off
select .
--
eof

