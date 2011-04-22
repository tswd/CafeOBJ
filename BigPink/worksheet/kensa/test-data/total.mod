**>
**> $B8!>Z%7%9%F%`Am9g8!::(B
**> cache coherence problem by A.Mori (amori@jaist.ac.jp)
**>

**> $B%G!<%?$rDj5A$7$?%b%8%e!<%k(B
module* DATA
{
  [ Index Data ]
}

**> $B%7%9%F%`>uBV$r<($9%U%i%0$rDj5A$7$?%b%8%e!<%k(B
module! FLAG
{
  [Flag]
  ops invalid vex dirty shared : -> Flag
  -- vex == valid exclusive
}

**> Cache $B$N%W%m%H%3%k$rDj5A$7$?%b%8%e!<%k(B
**>
module* PROTOCOL
{
  protecting (BOOL + DATA + FLAG)
  *[Protocol]*
  bop flag  : Index Protocol -> Flag    -- cache state
  bop cdata : Index Protocol -> Data    -- cache value
  bop mdata : Protocol -> Data         -- memory value
  bop read  : Index Protocol -> Protocol
  bop write : Index Data Protocol -> Protocol
  op init   : -> Protocol

  vars I J K : Index
  vars M N : Data
  var P : Protocol
  -- initial state
  eq flag(I, init) = invalid .
  -- write
  eq cdata(I, write(I,M,P)) = M .
  ceq cdata(J,write(I,M,P)) = cdata(J,P) if not(I == J) .
  eq flag(J, write(J,M,P)) = dirty .
    -- invalidation
  ceq flag(J, write(I,M,P)) = invalid if not(I == J) .
  eq mdata(write(I,M,P)) = mdata(P) .
  -- read
    -- read hit
  bceq read(I,P) = P if not(flag(I,P) == invalid) .
    -- if there is a dirty copy Cj then
    -- Cj provides the missig block.
  eq cdata(I, read(I, write(J,M,P))) = M . 
  eq mdata(read(I, write(J,M,P))) = mdata(P) .
  ceq flag(I,read(I,write(J,M,P))) = shared if not(I == J) .
  ceq flag(J,read(I,write(J,M,P))) = shared if not(I == J) .
    -- if there is a clean copy Cj then
  ceq cdata(I,read(I,read(J,P))) = cdata(J,read(J,P)) if not(I == J) .
    -- Cj provides the missing block
  ceq flag(I,read(I,read(J,P))) = shared if not(I == J) .
  ceq flag(J,read(I,read(J,P))) = shared if not(I == J) .
  -- independence
  beq read(I,read(I,P)) = read(I,P) .
  ceq flag(I,read(J,read(K,P))) = flag(I, read(K,P))
      if not(I == J) and not(I == K) .
  ceq cdata(I,read(J,P)) = cdata(I,P) if not(I == J) .
  eq mdata(read(I,P)) = mdata(P) .
  -- if there is no cached copy (i.e., only in initial state)
  eq cdata(I,read(I,init)) = mdata(init) .
  eq flag(I,read(I,init)) = vex .
  eq mdata(read(I,init)) = mdata(init) .
}

**> Cache $B$N%W%m%H%3%k$K4X$7$F(B, $BJ]>Z$9$Y$-@-<A(B P $B$r(B
**> $BI=8=$9$k%b%8%e!<%k(B.
**> P $B$N0UL#$O(B, cache X $B$K$*$$$F(B, $B%$%s%G%/%9(B I $B$H(B J $B$G(B
**> $B$5$5$l$k%]%$%s%H$N>uBV$,$H$b$K(B shared $B$J$i$P(B,
**> $B$=$l$i$N%G!<%?CM$,Ey$7$$(B, $B$H$$$&$b$N$G$"$k(B.
**> $B0J2<$G$O(B, $B$3$N@-<A$,%7%9%F%`>uBV$NJQ2=$K$h$i$:(B,
**> $B>o$KJ]>Z$5$l$k;v$r>ZL@$9$k(B.

module PROOF
{
  protecting (PROTOCOL)
  protecting (FOPL-CLAUSE)

  ** definition of invariant:
  -- use P(X) as macro like manner by using "#dfine" command:
  pred P : Protocol .         -- the predicate for invariant.
  #define P(X:Protocol)
     ::= \A[I:Index, J:Index] flag(I,X) = shared & flag(J,X) = shared
         -> cdata(I,X) = cdata(J,X) .
}

**> ========
**> $B>ZL@3+;O(B
**> ========
**> there are 3 goals.
--> (1) P must be satisfied at the initial sate:
-->     P(init) .
--> (2,3) also after applying read and write oprations.
-->    \A[S:Protocol]\A[I:Index] P(S) -> P(read(I,S)) .
-->    \A[S:Protocol]\A[I:Index, M:Data] P(S) -> P(write(I,M,S)) .
**> (1)

**> preset pignose option flags & parameters
evq (setq *print-line-limit* 44)
option reset
flag (auto,on)
flag (universal-symmetry,on)
flag (dist-const,on)
flag (print-stats,on)
flag (randomize-sos,off)
param (max-weight,14)
flag (quiet,on)

**> save the option-set as `ccp-quiet-set'
save-option ccp-quiet-set

**> another option set.
option reset
flag (auto,on)
flag (universal-symmetry,on)
flag (dist-const,on)
flag (randomize-sos,off)
param (max-weight,14)
save-option ccp-set

**> we use ccp-set options
option = ccp-set

open PROOF

**> show P(init)
goal P(init) .
resolve .
close
**

open PROOF
**> show P(X) is invariant w.r.t. read operation.
--> goal \A[S:Protocol]\A[I:Index] P(S) -> P(read(I,S)) .
goal \A[S:Protocol]\A[I:Index] P(read(I,S)) .
** it's safe to reset options because some parameters may
** have been changed during the previous run in automatic manner
** (max-weight, for example).
** use preset option set `ccp-set'.
option = ccp-set
resolve .
close

open PROOF
**> show P(X) is invariant w.r.t. write operation.
-->  goal \A[S:Protocol]\A[I:Index, M:Data] P(S) -> P(write(I,M,S)) .
goal \A[S:Protocol]\A[I:Index, M:Data] P(write(I,M,S)) .
option = ccp-set
resolve .
close

**
eof

