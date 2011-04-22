;;;-*- Mode:Lisp; Syntax:Common-Lisp; Package:CHAOS -*-
;;; $Id: dag.lisp,v 1.4 2010-05-30 04:34:43 sawada Exp $
(in-package :CHAOS)
#|==============================================================================
				 System: Chaos
				 Module: comlib
				 File: dag.lisp
==============================================================================|#
#-:chaos-debug
(declaim (optimize (speed 3) (safety 0) #-GCL (debug 0)))
#+:chaos-debug
(declaim (optimize (speed 1) (safety 3) #-GCL (debug 3)))

;;; dag node = ( datum List[node] . flag )
;;; flag is used for dag traverse, i.e. marked=already visited.

(defstruct dag-node
  (datum nil :type t)
  (subnodes nil :type list)
  (flag nil :type (or null t)))

;;; basic constructor
(defmacro create-dag-node (datum subnodes)
  `(make-dag-node :datum ,datum :subnodes ,subnodes))

;;; adding sub node
(defmacro add-subnodes (dag datums)
  (once-only (dag)
    `(setf (dag-node-subnodes ,dag)
       (nconc (dag-node-subnodes ,dag)
	      (mapcar #'(lambda (d) (create-dag-node d nil))
		      ,datums)))))

(defmacro push-sub-node (dag datum)
  `(push (create-dag-node ,datum nil)
	 (dag-node-subnodes ,dag)))

;;; 
(defmacro dag-node-is-marked? (node) `(dag-node-flag ,node))
(defmacro mark-dag-node (node) `(setf (dag-node-flag ,node) t))
(defmacro unmark-dag-node (node) `(setf (dag-node-flag ,node) nil))

(defun unmark-all-dag-nodes (dag)
  (declare (type dag-node dag))
  (unmark-dag-node dag)
  (dolist (sub (dag-node-subnodes dag))
    (declare (type dag-node sub))
    (unmark-all-dag-nodes sub)))

;;; dag-dfs : dag function
;;; traversing dag by depth first manner, apply function to each node.
;;;
(defun dag-dfs (dag &optional (function #'identity))
  (declare (type dag-node dag)
	   (type (or symbol function) function)
	   (values t))
  (labels ((do-dag-dfs (d)
	     (unless (dag-node-is-marked? d)
	       (dolist (sub (dag-node-subnodes d))
		 (unless (dag-node-is-marked? sub)
		   (do-dag-dfs sub)))
	       (funcall function d)
	       (mark-dag-node d))))
  (unmark-all-dag-nodes dag)
  (do-dag-dfs dag)))

;;; dag-wfs : dag function
;;; traversing dag by width first manner, apply function to each node.
;;;
(defun dag-wfs (dag &optional (function #'identity))
  (declare (type dag-node dag)
	   (type (or symbol function) function)
	   (values t))
  (labels ((do-dag-wfs (ld)
	     (dolist (d ld)
	       (unless (dag-node-is-marked? d)
		 (funcall function d)
		 (mark-dag-node d)))
	     (dolist (d ld)
	       (do-dag-wfs (dag-node-subnodes d)))))
    (unmark-all-dag-nodes dag)
    (do-dag-wfs (list dag))))

;;; bi-directional graph
;;;
(defstruct (bdag (:include dag-node))
  (parent nil))

(defmacro create-bdag-node (datum subnodes)
  (once-only (subnodes datum)
   `(let ((bdag (make-bdag :datum ,datum :subnodes ,subnodes :parent nil)))
      (dolist (s ,subnodes)
	(setf (bdag-parent s) bdag))
      bdag)))

(defmacro add-bdag-subnodes (bdag datums)
  (once-only (bdag datums)
    `(setf (dag-node-subnodes ,bdag)
       (nconc (dag-node-subnodes ,bdag)
	      (mapcar #'(lambda (d)
			  (let ((sub (create-bdag-node d nil)))
			    (setf (bdag-parent sub) ,bdag)
			    sub))
		      ,datums)))))

(defmacro push-bdag-node (dag datum)
  (once-only (dag)
    `(push (let ((s (create-bdag-node ,datum nil)))
	     (setf (bdag-parent s) ,dag)
	     s)
	   (dag-node-subnodes ,dag))))


(defun get-bdag-parents (bdag)
  (declare (type bdag bdag))
  (let ((res nil)
	(parent (bdag-parent bdag)))
    (while parent
      (push parent res)
      (setq parent (bdag-parent parent)))
    res))

;;; EOF
