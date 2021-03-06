** -*- Mode:CafeOBJ -*-
** $Id: truth.mod,v 1.3 2007-01-24 23:26:24 sawada Exp $
** system: Chaos
** module: library
** file: truth.mod
** -------------------------------------------------------------

--
-- NOTE: You may need to modify `setup-truth' if you change
--       the definition of module TRUTH
--
lispq
(defun setup-truth ()
  (setq *TRUTH-module* (eval-modexp "TRUTH"))
  (prepare-for-parsing *truth-module*)
  (with-in-module (*truth-module*)
    (let* ((sort-mem-op-info (find-operator '("_" ":is" "_")
					    2
					    *truth-module*))
	   (sort-mem-meth (lowest-method* (car (opinfo-methods sort-mem-op-info)))))
      (setq *sort-membership* sort-mem-meth))
    
    (let* ((if-op-info (find-operator '("if" "_" "then" "_" "else" "_" "fi")
				      3
				      *truth-module*))
	   (if-meth (lowest-method* (car (opinfo-methods if-op-info)))))
      ;; if_theh_else_fi must be treated in special manner
      ;; we need to see it globaly in system
      (setq *BOOL-if* if-meth)
      ;; 
      (let* ((equal-op-info (find-operator '("_" "==" "_") 2 *truth-module*))
	     (equal-meth (lowest-method* (car (opinfo-methods equal-op-info))))
	     (match-op-info (find-operator '("_" ":=" "_") 2 *truth-module*))
	     (match-meth (lowest-method* (car (opinfo-methods match-op-info))))
	     (beq-op-info (find-operator '("_" "=*=" "_") 2 *truth-module*))
	     (beq-meth (lowest-method* (car (opinfo-methods beq-op-info))))
	     (n-equal-op-info (find-operator '("_" "=/=" "_") 2 *truth-module*))
	     (n-equal-meth (lowest-method* (car (opinfo-methods n-equal-op-info))))
	     (beh-eq-info (find-operator '("_" "=b=" "_") 2 *truth-module*))
	     (beh-eq-meth (lowest-method* (car (opinfo-methods beh-eq-info)))))
        ;; also these operators are needed to be accessed globaly
        ;; for TRAM(BRUTE) interface and PigNose
	(setq *bool-equal* equal-meth)
	(setq *bool-match* match-meth)
	(setq *beh-equal* beq-meth)
	(setq *bool-nonequal* n-equal-meth)
	(setq *beh-eq-pred* beh-eq-meth)
	))))

** allow using universal sorts
set sys universal-sort on

** we don't want to include BOOL of course
lispq
(progn 
  (setq $temp2 *include-bool*)
  (setq *include-bool* nil))

** TRUTH
sys:mod! TRUTH 
     principal-sort Bool
{
  -- TRUTH-VALUE is a hardwired builtin which declares sort Bool and
  -- two constants true and false.
  protecting (TRUTH-VALUE)
  signature {
    pred _:is_ : *Cosmos* SortId  { prec: 125 }
    op if_then_else_fi : Bool *Cosmos* *Cosmos* -> *Cosmos*
      { strat: (1 0) prec: 0 }
    pred _==_ : *Cosmos* *Cosmos*  { prec: 51 }
    pred _=*=_ : *HUniversal* *HUniversal* { prec: 51 }
    pred _=b=_ : *Cosmos* *Cosmos* { prec: 51 }
    pred _=/=_ : *Cosmos* *Cosmos* { prec: 51 }
    pred _:=_  : *Cosmos* *Cosmos* { prec: 51 }
  }
  axioms {
    var XU : *Universal*
    var YU : *Universal*
    var CXU : *Cosmos*
    var CYU : *Cosmos*
    eq CXU :is Id:SortId = #!! (coerce-to-bool (test-term-sort-membership cxu id)) .
    eq if true then CXU else CYU fi
     = CXU .
    eq if false then CXU else CYU fi
     = CYU .
    eq CXU == CYU = #!! (coerce-to-bool (term-equational-equal cxu cyu)) .
    eq CXU =b= CYU = #!! (coerce-to-bool (term-equational-equal cxu cyu)) .
    eq CXU =/= CYU = #!! (coerce-to-bool (not (term-equational-equal cxu cyu))) .
    eq CXU := CYU = #!! (coerce-to-bool (match-m-pattern CXU CYU)) .
  }
}  

** setup truth module
lispq
(setup-truth)
lispq
(setup-tram-bool-modules)
lispq
(init-builtin-universal)
**
set sys universal-sort off
lispq
(setq *include-bool* $temp2)
**
provide truth
provide TRUTH
**
eof

