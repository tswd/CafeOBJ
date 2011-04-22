** $Id: t0.mod,v 1.1.1.1 2003-06-19 08:30:07 sawada Exp $
** test formula translation
open BOOL .
protecting (FOPL-CLAUSE)
ops P Q R : -> Bool .
let t1 = (P | Q) & (P | Q | R) .
let t2 = (P & Q) | (P & Q & R) .
option reset
db reset
**> t1
clause t1 .
**> t2
clause t2 .

**> without formula simplification
flag(simplify-fol,off)
**> t1
clause t1 .
**> t2
clause t2 .
close
--
eof
