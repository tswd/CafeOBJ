** $Id: stream.mod,v 1.1.1.1 2003-06-19 08:30:02 sawada Exp $
** STREAM
** 
option reset

mod* STREAM(X :: TRIV)
{
  *[ Stream ]*
  bop head : Stream -> Elt
  bop tail : Stream -> Stream
  bop _&_  : Elt Stream -> Stream
  var E : Elt 
  var S : Stream
  eq head(E & S) = E .
  beq tail(E & S) = S .
}

mod* REV
{
  pr(STREAM(BOOL))

  bop rev : Stream -> Stream
  var S : Stream
  eq head(rev(S)) = not head(S) .
  beq tail(rev(S)) = rev(tail(S)).
}

set trace on
cbred in REV : rev(rev(S)) == S .
set trace off

mod* ZIP(X :: TRIV)
{
  pr(STREAM(X))
  op zip : Stream Stream -> Stream {coherent}
  vars S S' : Stream
  eq head(zip(S,S')) = head(S) .
  beq tail(zip(S,S')) = zip(S',tail(S)) .
}

mod* BLINK
{
  pr(ZIP(NAT))

  ops zero one blink : -> Stream
  eq head(zero) = 0 .
  beq tail(zero) = zero .
  eq head(one) = 1 .
  beq tail(one) = one .
  eq head(blink) = 0 .
  eq head(tail(blink)) = 1 .
  beq tail(tail(blink)) = blink .
}

set trace on
cbred in BLINK : blink == zip(zero,one) .
set trace off

mod* NAT-STREAM
{
  pr(STREAM(NAT))

  op nat : Nat -> Stream
  bop succ : Stream -> Stream
  op nat' : Nat -> Stream

  var N : Nat
  var S : Stream

  eq head(nat(N)) = N .
  beq tail(nat(N)) = nat(N + 1) .
  eq head(succ(S)) = head(S) + 1 .
  beq tail(succ(S)) = succ(tail(S)) .
  eq head(nat'(N)) = N .
  beq tail(nat'(N)) = succ(nat'(N)) .
}

set trace on
cbred in NAT-STREAM : nat(N) == nat'(N) .
set trace off

mod* FIBO-NAT
     principal-sort Nat
{
  ex(NAT)
  op f : Nat -> Nat
  var N : Nat 
  eq f(0) = 0 .
  eq f(1) = 1 .
  eq f(N + 2) = f(N + 1) + f(N).
  -- ceq f(N) = f(p(N)) + f(p(p(N))) if N > 1 .
}

mod* FIBO-STREAM
{
  pr(ZIP(FIBO-NAT))
  op nat : Nat -> Stream 
  bop f : Stream -> Stream
  bop add : Stream -> Stream
  op fib : Nat -> Stream 
  op fib' : Nat -> Stream 

  var N : Nat
  var S : Stream

  eq head(nat(N)) = N .
  beq tail(nat(N)) = nat(N + 1) .
  eq head(f(S)) = f(head(S)) .
  beq tail(f(S)) = f(tail(S)) .
  eq fib(N) = f(nat(N)) .
  eq head(add(S)) = head(S) + head(tail(S)) .
  beq tail(add(S)) = add(tail(tail(S))) .
  eq head(fib'(N)) = f(N) .
  eq head(tail(fib'(N))) = f(N + 1).
  beq tail(tail(fib'(N))) = add(zip(fib'(N),tail(fib'(N)))) .
}

select FIBO-STREAM
-- option reset
-- flag(lrpo,on)
-- lex(add, tail, fib', fib)
set trace on
cbred fib(N) == fib'(N) .
set trace off
select .
--
eof

