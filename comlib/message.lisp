;;;-*- Mode:LISP; Package:CHAOS; Base:10; Syntax:Common-lisp -*-
;;; $Id: message.lisp,v 1.3 2010-07-14 01:59:02 sawada Exp $
(in-package :chaos)
#|==============================================================================
				 System: CHAOS
				 Module: comlib
			       File: message.lisp
==============================================================================|#
#-:chaos-debug
(declaim (optimize (speed 3) (safety 0) #-GCL (debug 0)))
#+:chaos-debug
(declaim (optimize (speed 1) (safety 3) #-GCL (debug 3)))

(defun flush-all ()
  (finish-output *standard-output*)
  (finish-output *error-output*)
  )

(defun fresh-all ()
  (fresh-line *standard-output*)
  (fresh-line *error-output*))

(defmacro with-output-chaos-error ((&optional (tag 'to-top)) &body body)
  ` (progn
      ;; (flush-all)
      ;; (fresh-all)
      (let ((*standard-output* *error-output*)
	    (*print-indent* 4))
	(format t "~&[Error]: ")
	,@body)
      ,(if (eq tag 'to-top)
	   `(chaos-to-top)
	   `(chaos-error ,tag)
      )))

(defmacro with-output-chaos-warning ((&optional (stream '*error-output*)) &body body)
  ` (unless *chaos-quiet*
      ;; (fresh-all)
      ;; (flush-all)
      (let ((*standard-output* ,stream)
	    (*print-indent* 4)) 
	(format t "~&[Warning]: ")
	,@body)
      (flush-all)))

(defmacro with-output-panic-message ((&optional (stream '*error-output*)) &body body)
  ` (progn
      ;; (fresh-all)
      ;; (flush-all)
      (let ((*standard-output* ,stream))
	(print-next)
	(princ "!! PANIC !!: ")
	,@body)
      (chaos-to-top)))

;;;
(defmacro with-output-msg ((&optional (stream '*error-output*)) &body body)
  ` (unless *chaos-quiet*
      ;; (fresh-all)
      ;; (flush-all)
      (let ((*standard-output* ,stream)
	    (*print-indent* 3))
	(format t "~&-- ")
	,@body)
      (flush-all)))

(defmacro with-output-simple-msg ((&optional (stream '*error-output*)) &body body)
  ` (unless *chaos-quiet*
      ;; (fresh-all)
      ;; (flush-all)
      (let ((*standard-output* ,stream)
	    (*print-indent* 2))
	(format t "~&")
	,@body)
      (flush-all)))

;;;
(defun print-in-progress (str)
  (unless *chaos-quiet*
    (princ str *error-output*)
    (finish-output *error-output*)))

;;; I-miss-current-module me
;;; Checks if the *current-module* is bound, returns nil with an error mesage if
;;; *current-mdoule* is not bound to non-nil value.
;;; - me must a name (symbol) of a block.
;;;
(defmacro I-miss-current-module (me)
  ` (unless *current-module*
      (fresh-all)
      (flush-all)
      (with-output-panic-message ()
	(format t "in ~a : no current module is specified!" ',me)
	(force-output)
	(finish-output)
	(return-from ,me nil))))

;;; EOF
