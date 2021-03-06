** -*- Mode:CafeOBJ -*-
** $Id: bool.mod,v 1.4 2007-03-05 11:02:08 sawada Exp $
** system: Chaos
** module: library
** file: bool.mod
** -------------------------------------------------------------

lispq
(setq *include-bool-save* *include-bool*)
set include BOOL off

require base_bool

lispq
(setq *include-bool-save* *include-bool*)
set include BOOL off

--
-- NOTE: You may need to modify `setup-BOOL' if you change
--       the definition of module BOOL
--
lispq
(defun setup-bool ()
  (unless *bootstrapping-bool*
    (setf *bootstrapping-bool* t)
    (unless (modexp-is-error (eval-modexp "BOOL"))
      (with-outout-chaos-error ('more-than-one-bool)
	(format t "You cann not define BOOL module more than once in a session.")))
    (if (and *user-bool* (not (equal "" *user-bool*)))
	(cafeobj-input *user-bool*)
      (cafeobj-input "sys_bool"))
    ;;
    (setq *BOOL-module* (eval-modexp "BOOL"))
    (with-in-module (*bool-module*)
      (let* ((and-op-info (find-operator '("_" "and" "_") 2 *bool-module*))
	     (and-meth (lowest-method* (car (opinfo-methods and-op-info)))))
	(setq *bool-and* and-meth))
      (let* ((or-op-info (find-operator '("_" "or" "_") 2 *bool-module*))
	     (or-meth (lowest-method* (car (opinfo-methods or-op-info)))))
	(setq *bool-or* or-meth))
      (let* ((not-op-info (find-operator '("not" "_") 1 *bool-module*))
	     (not-meth (lowest-method* (car (opinfo-methods not-op-info)))))
	(setq *bool-not* not-meth))
      (let* ((xor-op-info (find-operator '("_" "xor" "_") 2 *bool-module*))
	     (xor-meth (lowest-method* (car (opinfo-methods xor-op-info)))))
	(setq *bool-xor* xor-meth))
      (let* ((imp-op-info (find-operator '("_" "implies" "_") 2 *bool-module*))
	     (imp-meth (lowest-method* (car (opinfo-methods imp-op-info)))))
	(setq *bool-imply* imp-meth))
      (let* ((and-also (find-operator '("_" "and-also" "_") 2 *bool-module*))
	     (and-also-meth (lowest-method* (car (opinfo-methods and-also)))))
	(setq *bool-and-also* and-also-meth))
      (let* ((or-else (find-operator '("_" "or-else" "_") 2 *bool-module*))
	     (or-else-meth (lowest-method* (car (opinfo-methods or-else)))))
	(setq *bool-or-else* or-else-meth))
      (let* ((iff (find-operator '("_" "iff" "_") 2 *bool-module*))
	     (iff-meth (lowest-method* (car (opinfo-methods iff)))))
	(setq *bool-iff* iff-meth))
      )))

-- **
-- ** MODULE BOOL
-- ** 
-- ** we don't want to include BOOL of course
-- set include BOOL off

-- sys:mod! BOOL
--       principal-sort Bool
-- {
--   imports {
--     protecting (TRUTH)
--     protecting (EQL)
--   }
--   signature {
--     op _and_ : Bool Bool -> Bool { assoc comm prec: 55 r-assoc }
--     op _and-also_ : Bool Bool -> Bool { strat: (1 0 2) prec: 55 r-assoc }
--     op _or_ : Bool Bool -> Bool { assoc comm prec: 59 r-assoc }
--     op _or-else_ : Bool Bool -> Bool { strat: (1 0 2) prec: 59 r-assoc }
--     op _xor_ : Bool Bool -> Bool { assoc comm prec: 57 r-assoc }
--     op not_ : Bool -> Bool { strat: (0 1) prec: 53 }
--     op _implies_ : Bool Bool -> Bool { strat: (0 1 2) prec: 61 r-assoc }
--     op _iff_ : Bool Bool -> Bool { strat: (0 1 2) prec: 63 r-assoc }
--   }
--   axioms {
--     var A : Bool
--     var B : Bool
--     var C : Bool
--     eq false and A = false .
--     eq true and A = A .
--     eq A and A = A .
--     eq A xor A = false .
--     eq false xor A = A .
--     eq A and (B xor C) = A and B xor A and C .
--     eq A or A = A .
--     eq false or A = A .
--     eq true or A = true .
--     eq A or B = A and B xor A xor B .
--     eq not A = A xor true .
--     eq A implies B = A and B xor A xor true .
--     eq A iff B = A xor B xor true .
--     eq A and-also false = false .
--     eq false and-also A = false .
--     eq A and-also true = A .
--     eq true and-also A = A .
--     eq A and-also A = A .
--     eq false or-else A = A .
--     eq A or-else false = A .
--     eq true or-else A = true .
--     eq A or-else true = true .
--   }
-- }

** setting up
lispq
(setup-bool)
lispq
(unless *bootstrapping-bool*
  (setup-tram-bool-modules)
  (init-builtin-universal)
)
**
** evq (setq *include-bool* *include-bool-save*)
**
set include BOOL on
**
provide bool
provide BOOL
**
eof
