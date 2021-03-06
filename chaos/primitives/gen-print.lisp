;;;-*- Mode: Lisp; Syntax:CommonLisp; Package:CHAOS; Base:10 -*-
;;; $Id: gen-print.lisp,v 1.17 2010-07-15 04:40:55 sawada Exp $
(in-package :chaos)
#|=============================================================================
                                  System:CHAOS
                               Module: primitives
                              File: gen-print.lisp
=============================================================================|#
#-:chaos-debug
(declaim (optimize (speed 3) (safety 0) #-GCL (debug 0)))
#+:chaos-debug
(declaim (optimize (speed 1) (safety 3) #-GCL (debug 3)))

;;; *************
;;; TERM PRINTERS______________________________________________________________
;;; *************

;;; TERM-PRINT : TERM STREAM -> VOID
;;; print term TERM to stream STREM.
;;; the printer controll global *fancy-print* is non-nil, the term will be
;;; printed in a fancy manner.

;;; **TODO** for coded terms

(declaim (special *current-term-depth*)
         (type fixnum *current-term-depth*))
(defvar *current-term-depth* 0)

(declaim (special .printed-vars-so-far.))
(defvar .printed-vars-so-far. nil)

(declaim (special **print-var-sort**))
(defvar **print-var-sort** t)


;;; VARIABLE

(defun print-variable (term &optional (stream *standard-output*))
  (let ((*standard-output* stream)
        (body (term-body term)))
    (princ (string (variable$print-name body)))
    (princ ":")
    (princ (sort-id (variable$sort body)))))

;;; AST ::= "(" keyword-symbol . arguments ")"
;;;

(defun print-ast-vd (ast stream print-var-sort)
  (print-check)
  (cond ((consp ast)
         (let ((flg nil))
           (format stream ":~a(" (car ast))
           (dolist (arg (cdr ast))
             (if flg (princ ","))
             (term-print arg stream print-var-sort)
             (setf flg t))
           (princ ")")))
        (t (princ ast))))

;;;
;;;
;;;
(defvar *print-term-color* nil)

(defun variable-print-string (term &optional (print-var-sort nil)
                                             (vars-so-far (cons nil nil)))
  (let ((name (if (numberp (variable-print-name term))
                  (format nil "_v~d" (variable-print-name term))
                (string (variable-print-name term)))))
    (when print-var-sort
      (unless (member term (cdr vars-so-far)
                      :test #'variable-eq)
        (push term (cdr vars-so-far))
        (when (and (let ((sort (variable-sort term)))
                     (not (or (eq sort *universal-sort*)
                              (eq sort *huniversal-sort*)
                              (eq sort *bottom-sort*)
                              (eq sort *cosmos*))))
                   (or *print-with-sort*
                       (not (rassoc term
                                    (module-variables *current-module*)))))
          (let ((sn (make-array '(0) :element-type 'base-char
                                :fill-pointer 0
                                :adjustable t)))
            (with-output-to-string (str sn)
              (let ((*standard-output* str))
                (print-sort-name (variable-sort term) *current-module*)))
            (setq name (concatenate 'string name ":" sn))))))
    name))

(defun bconst-print-string (term)
  (let ((val (term-builtin-value term))
        (bstr (make-array '(0) :element-type 'base-char
                          :fill-pointer 0
                          :adjustable t)))
    (with-output-to-string (ss bstr)
      (let ((*standard-output* ss))
        (if (and (bsort-p (term-sort term))
                 (bsort-term-printer (term-sort term)))
            (funcall (bsort-term-printer (term-sort term))
                     val)
          (cond ((stringp val)
                 (if (not (sort= (term-sort term)
                                 *sort-id-sort*))
                     (progn (princ "\"") (princ val) (princ "\""))
                   (princ val)))
                ((symbolp val)
                 (princ (string val)))
                ((characterp val)
                 (print-character val))
                (t (princ val)))
          )))
    bstr))

(defun term-to-sexpr (term &optional (print-var-sort t)
                                     (vars-so-far (cons nil nil))
                                     (as-tree nil))
  (unless term
    (princ "!! empty term !!")
    (return-from term-to-sexpr nil))
  (cond ((term-is-variable? term)
         (if as-tree
             (return-from term-to-sexpr
               `(":var" ,(variable-print-string term print-var-sort vars-so-far)))
           (return-from term-to-sexpr
             (variable-print-string term print-var-sort vars-so-far))))
        ((term-is-psuedo-constant? term)
         (if as-tree
             (return-from term-to-sexpr
               `(":pvar" ,(variable-print-string term print-var-sort vars-so-far)))
           (return-from term-to-sexpr
             (variable-print-string term print-var-sort vars-so-far))))
        ((term-is-builtin-constant? term)
         (if as-tree
             (return-from term-to-sexpr
               `(":bconst" ,(bconst-print-string term)))
           (return-from term-to-sexpr
             (format nil "(~a)" (bconst-print-string term)))))
        ((term-is-lisp-form? term)
         (let ((type (if (term-is-simple-lisp-form? term)
                         (if as-tree
                             ":lisp"
                         "#!")
                       (if as-tree
                           ":glisp"
                         "#!!"))))
           (return-from term-to-sexpr
             (cons type (list (lisp-form-original-form term))))))
        ((term-is-applform? term)
         (let* ((hd (term-head term))
                (op (method-operator hd))
                (sexpr-so-far nil))
           (cond ((or as-tree (not (operator-is-mixfix op)))
                  (let ((opname 
                         (if as-tree
                             (format nil ":op ~{~a~^~}" (operator-symbol op))
                           (format nil "~{~a~^ ~}" (operator-symbol op))
                           )))
                    (push opname sexpr-so-far)
                    (dolist (i (term-subterms term))
                      (push (term-to-sexpr i print-var-sort vars-so-far as-tree)
                            sexpr-so-far))
                    (return-from term-to-sexpr (nreverse sexpr-so-far))))
                 ;; mix fix 
                 (t (let ((subs (term-subterms term))
                          (sexpr-so-far nil))
                      (dolist (i (operator-token-sequence op))
                        (cond ((eq t i)
                               (push (term-to-sexpr (car subs)
                                                    print-var-sort
                                                    vars-so-far
                                                    as-tree)
                                     sexpr-so-far)
                               (setq subs (cdr subs)))
                              (t 
                               (push i sexpr-so-far)
                               )))
                      (return-from term-to-sexpr (nreverse sexpr-so-far))
                      ))
                 )))))
  
(defun term-print1 (term &optional (stream *standard-output*) (print-var-sort t)
                                   (vars-so-far (cons nil nil)))
  (declare (type (or null term) term)
           (type stream stream)
           (type (or null t) print-var-sort)
           (values t))
  (let ((*standard-output* stream)
        (body (term-body term))
        (*current-term-depth* (1+ *current-term-depth*))
        (.file-col. .file-col.))
    ;;
    (when (and *term-print-depth*
               (> *current-term-depth*
                  (the fixnum *term-print-depth*)))
      (princ " ... ")
      (return-from term-print1 nil))
    (unless term
      (princ "!! empty term !!")        ; this should not happen in general,
                                        ; but may happen while debug output.
      (return-from term-print1 nil))

    (when (and (term-is-red term) *print-term-color*)
      (princ "r::"))
      
    (cond ((or (term$is-variable? body) (term$is-psuedo-constant? body))
           (let ((vstr (variable-print-string
                        term
                        print-var-sort
                        vars-so-far)))
             (princ vstr stream)))
          ((term$is-builtin-constant? body)
           (princ (bconst-print-string term) stream))
          ((term$is-lisp-form? body)
           (if (term$is-simple-lisp-form? body)
               (princ "#! " stream)
               (princ "#!! " stream))
           (format t "~s" (term$lisp-form-original-form body)))
          ((term$is-applform? body)
           (let* ((hd (term$head body))
                  (op nil))
             (setq op (method-operator hd))
             (cond ((not (operator-is-mixfix op))
                    ;; patch. 
                    ;; (princ (car (operator-symbol op)))
                    (let ((opname 
                           (format nil "~{~a~^ ~}" (operator-symbol op))))
                      (princ opname))
                    (let ((subs (term$subterms body)))
                      (when subs
                        (princ "(")
                        ;; (setq .file-col. (file-column stream))
                        (let ((flg nil))
                          (dolist (i subs)
                            (if flg
                                (progn (princ ",")
                                       )
                                (setq flg t))
                            (term-print1 i stream print-var-sort vars-so-far)))
                        (princ ")")
                        )))
                   ;; mix fix 
                   (t (let ((subs (term$subterms body))
                            (prv nil))
                        (princ "(" stream)
                        (dolist (i (operator-token-sequence op))
                          (when prv
                            (princ #\space stream))
                          (setq prv i)
                          (cond ((eq t i)
                                 (term-print1 (car subs)
                                              stream
                                              print-var-sort
                                              vars-so-far)
                                 (setq subs (cdr subs)))
                                (t ;;(print-check .file-col.
                                   ;;           (+ 2 (length (string i)))
                                   ;;           stream)
                                   (princ i stream)
                                   )))
                        (princ ")" stream))))))
          (t (format stream "~s" body)) ; what is this?
          )
    ))

(defun term-print2 (term prec
                    &optional (stream *standard-output*)
                              (print-var-sort t)
                              (vars-so-far (cons nil nil)))
  (declare (type (or null term) term)
           (type fixnum prec)
           (type stream stream)
           (type (or null t) print-var-sort)
           (values t))
  (let ((*standard-output* stream)
        (*current-term-depth* (1+ *current-term-depth*))
        ;; (*print-indent* *print-indent*)
        (.file-col. .file-col.))
    (when (and *term-print-depth*
               (> *current-term-depth*
                  (the fixnum *term-print-depth*)))
      (princ " ... " stream)
      (return-from term-print2 nil))
    ;;
    (unless term
      (princ "!! empty term !!" stream) ; this should not happen in general,
                                        ; but may happen while debug output.
      (return-from term-print2 nil))
    ;;
    ;;
    (when (print-check .file-col. 0 stream)             ; 20?? 
      (setq .file-col. (file-column stream)))
    ;;
    (when (and (term-is-red term) *print-term-color*)
      (princ "r::" stream))

    (cond ((or (term-is-variable? term) (term-is-psuedo-constant? term))
           (let ((vstr (variable-print-string term
                                              print-var-sort
                                              vars-so-far)))
             (princ vstr stream)))
          ((term-is-builtin-constant? term)
           (let ((bstr (bconst-print-string term)))
             (princ bstr stream)))
          ;;
          ((term-is-lisp-form? term)
           (if (term-is-simple-lisp-form? term)
               (princ "#! ")
               (princ "#!! "))
           (format t "~s" (lisp-form-original-form term))
           )
          ;; application form
          ((term-is-applform? term)
           (let* ((hd (term-head term))
                  (op nil))
             (setq op (method-operator hd))
             (cond ((not (operator-is-mixfix op))
                    ;; normal prefix operator
                    (let* ((name (format nil "~{~a~^ ~}" (operator-symbol op)))
                           (subs (term-subterms term))
                           (num-s (length subs)))
                      (declare (fixnum num-s))
                      (princ name)
                      (when subs
                        (princ "(" stream)
                        (setq .file-col. (file-column stream))
                        (let ((flg nil))
                          (do* ((sub subs (cdr sub))
                                (i (car sub) (car sub))
                                (x num-s (1- x)))
                              ((null i))
                            (when flg
                              (princ ", " stream)
                              (print-check .file-col. (* x 15) stream))
                            (term-print2 i parser-max-precedence
                                           stream print-var-sort
                                           vars-so-far)
                            (setq flg t)))
                        (princ ")" stream)
                        ))
                    )
                   ;; mix fix operators
                   (t (let ((prec-test (and (get-method-precedence hd)
                                            (<= prec (get-method-precedence hd))))
                            (assoc-test (method-is-associative hd))
                            (token-seq (operator-token-sequence
                                        (method-operator hd)))
                            )
                        (setq .file-col. (file-column stream))
                        (when prec-test
                          (princ "(" stream)
                          (setq .file-col. (1+ .file-col.))
                          )
                        ;;
                        (let ((subs (term-subterms term))
                              (prv nil))
                          (dolist (i token-seq)
                            (when prv
                              (princ #\space stream))
                            (setq prv t)
                            (cond
                             ((eq i t)
                              (let ((tm (car subs)))
                                (term-print2
                                 tm
                                 (if (and assoc-test
                                          tm
                                          (term-is-application-form? tm)
                                          (method-is-of-same-operator
                                           (term-head term)
                                           (term-head tm)))
                                     parser-max-precedence
                                   (or (get-method-precedence hd) 0))
                                 stream
                                 print-var-sort
                                 vars-so-far)
                                (setq subs (cdr subs))))
                             (t (let ((name (string i)))
                                  (princ name stream)
                                  (print-check .file-col. 20 stream)
                                  ;; (princ name)
                                  )
                                )))
                          )
                        (when prec-test (princ ")" stream))
                        ))
                   )))
          (t (format stream "~s" (term-body term))))
    ))

(defun term-print (term &optional (stream *standard-output*)
                                  (print-var-sort **print-var-sort**))
  (declare (type (or null term) term)
           (type (or t stream))
           (type (or null t) print-var-sort)
           (values t))
  (when (eq stream t)
    (setq stream *standard-output*))
  (let* ((vars-so-far (cons nil .printed-vars-so-far.))
         (.file-col. (file-column stream))
         (*print-indent* *print-indent*))
    #||
    (cond (*print-term-struct*
           (let ((*print-pretty* t))
             (princ (term-to-sexpr term print-var-sort vars-so-far t)
                    stream)))
          (*s-expr-print*
           (let ((*print-pretty* nil))
             (princ (term-to-sexpr term print-var-sort vars-so-far nil)
                    stream)))
          (*fancy-print*
           (let ((*print-pretty* nil))
             (term-print2 term
                          parser-max-precedence stream print-var-sort
                          vars-so-far)))
          (t (let ((*print-pretty* nil))
               (term-print1 term stream print-var-sort vars-so-far)
               )))
    ||#
    ;;
    (case *print-xmode*
      (:tree
       (let ((*print-pretty* t))
         (princ (term-to-sexpr term print-var-sort vars-so-far t)
                stream)))
      (:s-expr
       (let ((*print-pretty* t))
         (princ (term-to-sexpr term print-var-sort vars-so-far nil)
                stream)))
      (:fancy
       (let ((*print-pretty* nil))
         (term-print2 term
                      parser-max-precedence stream print-var-sort
                      vars-so-far)))
      (:normal
       (let ((*print-pretty* nil))
         (term-print1 term stream print-var-sort vars-so-far)
         ))
      (otherwise
       (with-output-chaos-error ('internal-error)
         (princ "invalid print mode value ~s" *print-xmode*))))
    ;;
    (cdr vars-so-far))
  )

(defun term-print-with-sort (term &optional (stream *standard-output*)
                                  ;; (print-var-sort *print-with-sort*)
                                  )
  (declare (type (or null term) term)
           (type stream stream)
           ;; (type (or null t) print-var-sort)
           (values t))
  (let ((*print-indent* (+ *print-indent* 2))
        ;; (**print-var-sort** print-var-sort)
        (**print-var-sort** nil)
        (paren? nil)
        )
    (setq paren?
          (case *print-xmode*
            (:fancy
             (if (or (term-is-variable? term)
                     (term-is-psuedo-constant? term))
                 nil
               t))
            (:normal
             (if (or (term-is-variable? term)
                     (term-is-psuedo-constant? term))
                 nil
               (if (and (term-is-applform? term)
                        (operator-is-mixfix (method-operator
                                                  (term-head term))))
                   nil
                 t)))
            (otherwise  nil)))
    ;;
    (when paren? (princ "(" stream))
    (term-print term stream)
    (when paren? (princ ")" stream))
    ;; (print-check 0 3)
    (when term
      (princ ":" stream)
      (print-sort-name (term-sort term) *current-module* stream))
    ;; (when bcv?
    ;;  (print-check 0 3))
    (flush-all)
    ))

(defun term-print-with-sort-string (term &optional
                                         (print-var-sort *print-with-sort*))
  (declare (ignore print-var-sort))
  (let ((str (make-array '(0)
                         :element-type 'base-char
                         :fill-pointer 0
                         :adjustable t)))
    (with-output-to-string (s str)
      ;; (term-print-with-sort term str print-var-sort)
      (term-print-with-sort term str))
    str))

;;;-----------------------------------------------------------------------------
;;; PRINT-TERM-SEQ : List[TERM]
;;; print sequence of terms separating each ",".
;;;
(defun print-term-seq (x)
  (declare (type list x)
           (values t))
  (if (null x)
      (princ "NULL")
      (let ((flg nil))
        (dotimes (i (length x))
          (declare (type fixnum i))
          (if flg
              (princ ",")
              (setq flg t))
          (princ " ")
          (let ((e (elt x i)))
            (term-print e)))
        )))

;;; PRINT-TERM-TREE
(defvar *show-sort* nil)

(defun print-term-tree (tree &optional (show-sort nil) (stream *standard-output*))
  (!print-term-tree tree show-sort stream nil))

(defun print-term-graph (tree &optional (show-sort nil) (stream *standard-output*))
  (!print-term-tree tree show-sort stream t))

(defun !print-term-tree (tree show-sort stream show-as-graph)
  (let* ((*show-sort* show-sort)
         (leaf?
          #'(lambda (tree) (or (term-is-variable? tree)
                               (term-is-constant? tree))))
         (leaf-name
          #'(lambda (term)
              (let ((name (if (term-is-builtin-constant? term)
                              (let ((value (term-builtin-value term)))
                                (cond ((characterp value)
                                       (format nil "('~a')" value))
                                      ((symbolp value)
                                       (string value))
                                      (t (format nil "(~s)" value))))
                              (if (term-is-variable? term)
                                  (string (variable-print-name term))
                                  (if (term-is-lisp-form? term)
                                      (lisp-form-original-form term)
                                      (format nil "~{~a~}"
                                              (method-symbol (term-head term)))))))
                    (sort (term-sort term)))
                (if *show-sort*
                    (format nil "~a:~a" name (string (if sort
                                                         (sort-id sort)
                                                       "unknown")))
                  name))))
         (leaf-info
          #'(lambda (tree) (declare (ignore tree)) t))
         (int-node-name
          #'(lambda (tree) (funcall leaf-name tree)))
         (int-node-children 
          #'(lambda (tree) (term-subterms tree))))
    (force-output stream)
    (print-next nil *print-indent* stream)
    (print-trees (list (if show-as-graph
                           (augment-tree-as-graph tree)
                           (augment-tree tree)))
                 stream)))

;;; ***************
;;; GENERIC PRINTER_____________________________________________________________
;;; ***************

;;; PRINT-AST : ast [ readable? output-stream ] -> void
;;;
;;; print out Chaos AST form to `output-stream'. the stream is defaulted to 
;;; *standard-output*.
;;; if `readable?' is T, the printed form can be evaluated by `eval-ast',
;;; otherwise, more descriptive output will be generated(NOT YET).
;;;

(defun print-ast (ast &optional (readable? t) (stream *standard-output*))
  (declare (ignore readable?))
  (print-chaos-object ast stream))

;;; PRINT-CHAOS-OBJECT
;;; simple printer for AST, TERM, INTERNAL OBJECTS.
;;;
(defun print-chaos-object (object &optional (stream *standard-output*))
  (cond ((chaos-ast? object)
         (let ((printer (ast-printer object)))
           (if printer
               (let ((mod (or *current-module* *last-module*)))
                 (if mod
                     (with-in-module (mod)
                       (funcall printer object stream))
                     (funcall printer object stream)))
               (let ((*print-circle* nil)
                     (*print-pretty* nil))
                 (prin1 object stream)))))
        ((and (chaos-object? object) (not (stringp object)))
         (let ((printer (object-printer object)))
           (if printer
               (let ((mod (or *current-module*
                              *last-module*)))
                 (if mod
                     (with-in-module (mod)
                       (funcall printer object stream))
                     (funcall printer object stream)))
               (let ((*print-circle* nil)
                     (*print-pretty* nil))
                 (prin1 object stream)))))
        ((term? object)
         (let ((mod (or *current-module* *last-module*)))
           (if mod
               (with-in-module (mod)
                 (term-print object stream))
               (term-print object stream))))
        ((opinfo-p object) 
         (fresh-line stream)
         (print-chaos-object (opinfo-operator object) stream)
         (format stream "~&-- delcrations -------------------")
         (dolist (meth (opinfo-methods object))
           (print-next)
           (print-chaos-object meth stream)))
        ((is-operator-theory? object)
         (print-theory-brief object stream))
        ((consp object)
         (princ "(" stream)
         (let ((*print-indent* (+ 2 *print-indent*))
               (flg nil))
           (do ((elem object (cdr elem)))
               ((not (consp elem))
                (unless (listp elem)
                  (princ " . " stream) (print-chaos-object elem stream)))
             (when flg
               (princ " " stream))
             (print-chaos-object (car elem)  stream)
             (setq flg t)))
         (princ ")" stream))
        (t (let ((*print-circle* nil)
                 (*print-pretty* nil))
             (prin1 object stream)))))
           
(defun print-obj-list (lst)
  (let ((flag nil))
    (do ((l lst (cdr l)))
        ((atom l) (unless (null l) (print-chaos-object l nil)))
      (if flag (print-next) (setq flag t))
      (print-chaos-object (car l)))))

;;; SOME SPECIFIC PRINTERS
;;;-----------------------------------------------------------------------------
(defun print-theory-brief (thy &optional (stream *standard-output*))
  (let ((th-info (theory-info thy))
        (flag nil)
        (val (theory-zero thy)))
    ;; (when (theory-info-is-empty-for-matching th-info)
    ;; (princ "empty")
    ;; (return-from print-theory-brief nil))
    (when (or (theory-info-is-AC th-info)
              (theory-info-is-A th-info)
              (theory-info-is-AI th-info)
              (theory-info-is-AZ th-info)
              (theory-info-is-AIZ th-info)
              (theory-info-is-ACI th-info)
              (theory-info-is-ACZ th-info)
              (theory-info-is-ACIZ th-info))
      (setq flag t)
      (princ "assoc" stream))
    (when (or (theory-info-is-AC th-info)
              (theory-info-is-C th-info)
              (theory-info-is-CI th-info)
              (theory-info-is-CZ th-info)
              (theory-info-is-CIZ th-info)
              (theory-info-is-ACI th-info)
              (theory-info-is-ACZ th-info)
              (theory-info-is-ACIZ th-info))
      (if flag (princ " " stream) (setq flag t))
      (princ "comm" stream))
    (when (or (theory-info-is-I th-info)
              (theory-info-is-IZ th-info)
              (theory-info-is-CI th-info)
              (theory-info-is-CIZ th-info)
              (theory-info-is-AI th-info)
              (theory-info-is-AIZ th-info)
              (theory-info-is-ACI th-info)
              (theory-info-is-ACIZ th-info))
      (if flag (princ " " stream) (setq flag t))
      (princ "idem" stream))
    (when val
      (if flag (princ " " stream))
      (if (null (cdr val)) (princ "id: " stream) (princ "idr: " stream))
      (term-print (car val) stream))
    ))

(defun print-theory (th)
  (print-theory-info (theory-info th))
  (princ " zero: ")
  (let* ((zs (theory-zero th))
         (flag (and (consp zs)
                    (eq 'to-rename (car zs)))))
    (when flag
      (princ "to rename: ")
      (setq zs (cadr zs)))
    (if zs
        (progn
          (term-print (car zs))
          (when (cdr zs) (princ " rule-only")))
        (princ "NONE"))
    ))

(defun print-theory-info (thinf)
  (prin1 (theory-info-name thinf))
  (princ "[") (prin1 (theory-info-code thinf)) (princ ",")
  (print-check)
  (unless (theory-info-is-empty-for-matching thinf) (princ "not "))
  (princ "empty for matching,equal:")
  (prin1 (theory-info-match-equal-fun thinf))
  (princ ",")
  (print-next)
  (princ "init:")
  (prin1 (theory-info-match-init-fun thinf))
  (princ ",")
  (print-check)
  (princ "next:")
  (prin1 (theory-info-match-next-fun thinf))
  (princ "]"))

;;; little helper
(defun print-simple-princ-flat (x)
  #||
  (when (and (fboundp 'filecol)
             (< *print-line-limit* (filecol *standard-output*)))
    (print-next))
  ||#
  (cond ((null x))
        ((stringp x) (princ x))
        ((consp x)
         (let ((flag nil)
                 (tail x))
             (loop
              (when (not (consp tail)) (return))
              (if flag
                  (unless (or (null (car tail))
                              (equal "," (car tail)))
             (princ " "))
                  (setq flag t))
              (print-simple-princ-flat (car tail))
              (setq tail (cdr tail)))
             (when tail (princ " ... ") (prin1 tail))
             ))
        (t (print-chaos-object x))))

;;; HASH TABLE

(defun dump-chaos-hash (hash-table &optional (title "chaos hash table dump"))
  (format t "~&~a__________________________" title)
  (maphash #'(lambda (key value)
               (format t "~&key(type:~a) = | ~a ~%  " (type-of key) key)
               (print-chaos-object key)
               (format t "~&value(type:~a, ~a) = " (type-of value)
                       (if (chaos-object? value)
                           (object-type value)
                           (if (chaos-ast? value)
                               (ast-type value)
                               'unknown)))
               (print-chaos-object value)
               (format t "~&----------------------------------------"))
           hash-table))

;;; ASSOC TABLE
(defun dump-chaos-assoc-table (table &optional (title "chaos assoc table dump"))
  (format t "~&~a__________________________" title)
  (dolist (entry table)
    (let ((key (car entry))
          (value (cdr entry)))
      (format t "~&key(type:~a) = " (type-of key))
      (print-chaos-object key)
      (format t "~&value(type:~a, ~a) = "
              (type-of value)
              (if (chaos-object? value)
                  (object-type value)
                  (if (chaos-ast? value)
                      (ast-type value)
                      (type-of value)
                      )))
      (print-chaos-object value)
      (format t "~&----------------------------------------"))))
  
(defun dump-modexp-local ()
  (dump-chaos-assoc-table *modexp-local-table* "Moduexp Local "))
    
(defun dump-modules-so-far ()
  (dump-chaos-assoc-table *modules-so-far-table* "Module so far "))

(defun dump-modexp-eval ()
  (dump-chaos-assoc-table *modexp-eval-table* "Modexp eval table "))

(defun dump-modexp-view ()
  (dump-chaos-assoc-table *modexp-view-table* "Modexp view "))

;;; EOF
