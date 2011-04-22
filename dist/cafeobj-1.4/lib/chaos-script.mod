** -*- Mode:CafeOBJ -*-
** $Id: chaos-script.mod,v 1.3 2007-03-05 12:01:59 sawada Exp $
** system: Chaos
** module: library
** file: chaos-script.mod
** -------------------------------------------------------------

sys:mod! CHAOS:SCRIPT
{
  protecting(CHAOS:FORM)
  op eval : ChaosExpr -> ChaosExpr
  op lisp-eval : ChaosExpr -> ChaosExpr
  eq eval(X:ChaosExpr) = #!(%eval* X) .
  eq lisp-eval(X:ChaosExpr) = #!(%lisp-eval* X) .
  
}
