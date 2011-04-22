;;; $Id: version.in,v 1.1.1.1 2003-06-19 08:26:04 sawada Exp $
(in-package :chaos)
(defvar cafeobj-version)
(defvar cafeobj-version-major)
(defvar cafeobj-version-minor)
(defvar cafeobj-version-memo)
(defvar patch-level "")

(eval-when (eval load compile)
  (setq cafeobj-version-major "1.4")
  (setq cafeobj-version-memo (format nil "~a" "PigNose0.99"))
  (setq patch-level (format nil "~a" "33"))
  (if (not (equal "" cafeobj-version-memo))
      (if (not (equal "" patch-level))
          (setq cafeobj-version-minor
	    (format nil ".8(~a,p~A)" 
		    cafeobj-version-memo
		    patch-level))
	(setq cafeobj-version-minor 
	  (format nil ".8(~a)" cafeobj-version-memo)))
    (setq cafeobj-version-minor ".8"))
  (setq cafeobj-version (concatenate 'string
			  cafeobj-version-major
			  cafeobj-version-minor))
  )
;; EOF
