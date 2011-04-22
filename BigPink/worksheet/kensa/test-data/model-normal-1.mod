**>
**> $B%b%G%k8!::@5>o=*N;$N%1!<%9(B-1
**> 

set include FOPL-CLAUSE on

**> $B@0?t!'(B
mod! INT*
{
  [ Int ]
  op 0 : -> Int
  op _+_ : Int Int -> Int
  op _-_ : Int Int -> Int
  pred _<=_ : Int Int

  vars M N : Int
  ax M <= M .
  ax 0 <= M & 0 <= N -> 0 <= M + N .
  ax M <= N -> 0 <= N - M .
}

**> $B8}:B$N;EMM(B
mod* ACCOUNT
{
  protecting(INT*)
  *[ Account ]*
  -- $B=i4|>uBV(B
  op new-account : -> Account
  -- $B;D9b>H9g(B
  bop balance : Account -> Int
  -- $BMB$1F~$l(B
  bop deposit : Int Account -> Account
  -- $B0z$-=P$7(B
  bop withdraw : Int Account -> Account

  var A : Account    
  vars M N : Int

  eq balance(new-account) = 0 .
  ax 0 <= N -> balance(deposit(N,A)) = balance(A) + N .
  ax ~(0 <= N) -> balance(deposit(N,A)) = balance(A) .
  ax N <= balance(A) -> balance(withdraw(N,A)) = balance(A) - N .
  ax ~(N <= balance(A)) -> balance(withdraw(N,A)) = balance(A) .

}

**> ACCOUNT $B$K4X$9$k%b%G%k8!::$N$?$a$N%b%8%e!<%k(B
**> $BJ]>Z$7$?$$@-<A$O(B, $B=R8l(B P $B$GI=8=(B.

mod* PROOF
{
  protecting(ACCOUNT)

  pred P : Account .
  #define P(A:Account) ::= 0 <= balance(A) .
}

**> $BH?G}%(%s%8%s%*%W%7%g%s$N@_Dj(B
evq (setq *print-line-limit* 40)
--> auto $B%b!<%I$G9T$&(B.
option reset
flag(auto,on)

**> PROOF $B%b%8%e!<%k$N%*!<%W%s(B
open PROOF

**> $B%b%G%k8!::$N<B9T(B
--> $B=R8l(B P $B$O(B, $B;D9b(B(balance) $B$,@5$G$"$k$3$H$r=R$Y$?$b$N(B.
--> $B$3$l$,>o$KJ]>Z$5$l$k$3$H$r8!::$9$k(B.
--> check safety P from new-account
check safety P from new-account
**
close
