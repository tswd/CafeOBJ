** $Id: regexp.mod,v 1.2 2010-08-01 06:32:28 sawada Exp $
** regular expression

set accept =*= proof on

mod* REGEXP
{
  *[ RegExp ]*

  ops empty nil : -> RegExp
  op __ : RegExp RegExp -> RegExp { assoc id: nil coherent prec: 20 }
  op _+_ : RegExp RegExp -> RegExp { assoc id: empty comm idem coherent prec: 30 }
  bop _* : RegExp -> RegExp { prec: 10 }
  bop nil-in _ : RegExp -> Bool { prec: 40 }
  vars L L' : RegExp
  beq empty L = empty .
  eq nil-in L * = true .
  eq nil-in nil = true .
  eq nil-in empty = false .
  eq nil-in L + L' = nil-in L or nil-in L' .
  eq nil-in L L' = nil-in L and nil-in L' .

}

mod* ALETTER 
{
  pr(REGEXP)
  *[ Letter < RegExp ]*
}

mod* LETTER (X :: ALETTER)
{
  op x : -> Letter
  bop x? : RegExp -> Bool
  bop -x : RegExp -> RegExp {prec: 1}
  vars L L' : RegExp
  var X : Letter
  eq nil-in x = false .
  eq x?(L L') = x?(L) or nil-in L and x?(L') .
  eq x?(L + L') = x?(L) or x?(L') .
  eq x?(L *) = x?(L) .
  eq x?(X) = x == X .
  eq x?(nil) = false .
  eq x?(empty) = false .

  beq -x(L L') = (-x(L) L') + if (nil-in L) then -x(L') else empty fi .
  beq -x(L + L') = -x(L) + -x(L') .
  beq -x(L *) = -x(L) L * .
  beq -x(X) = if x == X then nil else empty fi .
  beq -x(nil) = empty .
  beq -x(empty) = empty .
}


mod* LANGUAGE (X :: ALETTER)
{
  pr(LETTER(X) * { op x -> a, bop x? -> a?, bop -x -> -a })
  pr(LETTER(X) * { op x -> b, bop x? -> b?, bop -x -> -b })
}

** the all of the followings should be true.
set trace off
option reset
select LANGUAGE
cbred a a * + nil == a * .
cbred (a + nil)* == a * .
cbred a * a == a a * .
cbred a(b a)* == (a b)* a .
cbred (a * b)* a * == a * (b a *)* .
cbred (a + b)* == (a * b *)* .

open .
  op L : -> RegExp .
  eq nil-in L = false .
  eq a?(L) = true .
  eq -a(L) = L .
  eq b?(L) = true .
  eq -b(L) = nil .
cbred L == a * b .
close
select .
  
