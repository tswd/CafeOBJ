** -*- Mode:CafeOBJ -*-
** $Id: eql.mod,v 1.7 2010-05-30 04:34:43 sawada Exp $
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
  pred _=_ : *Cosmos* *Cosmos* { comm prec: 51 }
  eq (CUX:*Cosmos* = CUX) = true .
  ceq [:nonexec]: CUX:*Cosmos* = CUY:*Cosmos* if (CUX = CUY) .
  eq (true = false) = false .
}

lispq
(defun setup-eql ()
  (setq *eql-module* (eval-modexp "EQL"))
  (prepare-for-parsing *eql-module*)
  (with-in-module (*eql-module*)
    (let* ((eq-op (find-operator '("_" "=" "_") 2 *eql-module*))
	   (eq-meth (lowest-method (car (opinfo-methods eq-op)))))
      (setq *eql-op* eq-meth))))

lispq
(setup-eql)

set sys universal-sort off
lispq
(setq *include-bool* $temp2)
**
provide eql
provide EQL
**
eof
** EOF
