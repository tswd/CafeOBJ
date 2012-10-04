** $Id: test5.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $

** propositoinal

module TEST5 {}

open TEST5 .
protecting (FOPL-CLAUSE)

pred P : .
pred Q : .
pred R : .

goal (P | Q) & (P | R) -> P | (Q & R) .

option reset
flag(auto,on)
resolve .
close
