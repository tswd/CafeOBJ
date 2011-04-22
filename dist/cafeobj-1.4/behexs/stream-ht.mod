** $Id: stream-ht.mod,v 1.1.1.1 2003-06-19 08:30:02 sawada Exp $
** stream
** with head & tail as cobasis

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
  eq head(N & S) = N .
  beq tail(N & S) = S .
  eq head(odd(S)) = head(S) .
  beq tail(odd(S)) = even(tail(S)) .
  eq head(even(S)) = head(tail(S)) .
  beq tail(even(S)) = even(tail(tail(S))) .
  eq head(zip(S, S')) = head(S) .
  beq tail(zip(S, S')) = zip(S', tail(S)) .
}

option reset
-- set trace on

select STREAM

cbred head(S) & tail(S) == S .
cbred zip(odd(S), even(S)) == S .
cbred even(tail(S)) == tail(odd(S)) .
cbred odd(tail(S)) == even(S) .
cbred odd(N & S) == N & even(S) .
cbred even(N & S) == odd(S) .
cbred odd(zip(S, S')) == S .
cbred even(zip(S, S')) == S' .

** the followings should be `fail'.
cbred zip(even(S), odd(S)) == S .
cbred zip(odd(S), tail(S)) == S .

set trace off
select .
--
eof
