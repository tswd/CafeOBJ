** -*- Mode:CafeOBJ -*-
** $Id: eql.mod,v 1.8 2010-06-17 08:23:18 sawada Exp $
** system: Chaos
** module: library
** file: eql.mod
** -------------------------------------------------------------

require truth

-- system internal flag : on -> allow using universal sorts.
--          Cosmos
--           /   \
--      Universal HUniveral

set sys universal-sort on

-- we don't want to include BOOL
lispq
(progn 
  (setq $temp2 *include-bool*)
  (setq *include-bool* nil))

sys:mod! EQL {
  protecting (TRUTH)
  pred _=_ : Cosmos Cosmos { comm prec: 51 }
  eq (CUX:Cosmos = CUX) = true .
}

set sys universal-sort off
lispq
(setq *include-bool* $temp2)
**
provide eql
provide EQL
**
eof
** EOF
