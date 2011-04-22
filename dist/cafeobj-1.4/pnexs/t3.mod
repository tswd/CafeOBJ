** $Id: t3.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** test formula translation
open NAT .
protecting (FOPL-CLAUSE)

ops P Q R : -> Bool .

let g1 = (P | Q) & (~ P | Q | R) & (~ Q | R) & ~ R .

option reset
db reset

**> g1 = 
show term g1 .
clause g1 .
--
close
eof

