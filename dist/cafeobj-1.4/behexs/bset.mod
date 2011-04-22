** $Id: bset.mod,v 1.1.1.1 2003-06-19 08:30:02 sawada Exp $

mod* BASICSET(X :: TRIV)
{
  *[ Set ]*

  op empty : -> Set
  bop _in_ : Elt Set -> Bool
  bop add  : Elt Set -> Set
  vars M N : Elt
  var S : Set
  eq N in empty = false .
  eq N in add(M,S) = (N == M) or (N in S) .
}

mod* SET
{
  pr(BASICSET)
  op _U_ : Set Set -> Set 
  op _@_ : Set Set -> Set
  op neg : Set -> Set
  vars N M : Elt 
  vars S1 S2 S3 S4 : Set
  eq N in S1 U S2 = (N in S1) or (N in S2) .
  eq N in S1 @ S2 = (N in S1) and (N in S2) .
  eq N in neg(S1) = not (N in S1) .
}

select SET
option reset
set trace off

cbred S1 U S2 == S2 U S1 .
cbred S1 @ S2 == S2 @ S1 .
cbred S1 U S1 == S1 .
cbred S1 @ S1 == S1 .
cbred (S1 U S2) U S3 == S1 U (S2 U S3) .
cbred (S1 @ S2) @ S3 == S1 @ (S2 @ S3) .
cbred S1 U (S2 @ S3) == (S1 U S2) @ (S1 U S3) .
cbred S1 @ (S2 U S3) == (S1 @ S2) U (S1 @ S3) .
cbred neg(S1 U S2) == neg(S1) @ neg(S2) .
cbred neg(S1 @ S2) == neg(S2) U neg(S1) .
cbred neg(neg(S1)) == S1 .
cbred ((S1 U S2) U S3) U S4 == ((S4 U S3) U S2) U S1 .

** the followings should be 'fail'
cbred neg(S1 U S2) == neg(S1) U neg(S2) .
cbred S1 U S2 == neg(S1 @ S2) .

select .
-- 
eof
