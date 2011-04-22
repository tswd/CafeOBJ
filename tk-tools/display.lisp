;;;-*- Mode:LISP; Package:TK; Base:10; Syntax:Common-lisp -*-
(in-package "TK")
#|==============================================================================
				 System: CHAOS
			      Module: tools.KERNEL
			       File: display.lisp
				  Version: 1.0
					
sawada@sra.co.jp
==============================================================================|#

;;; *NOTE* : This module is GCL specific, uses TCL/TK inteface.

;;; SHOW-SUBMODULE-LIST
;;;
(defun chaos::show-submodule-list (module &optional top-window)
  (let ((subs (chaos::module-submodules module))
	(sub-names nil))
    (unless subs (return-from chaos::show-submodule-list nil))
    (dolist (sub subs)
      (push (with-output-to-string (name)
	      (chaos::print-mod-name (car sub) name))
	    sub-names))
    (setq sub-names (nreverse sub-names))
    ;; make show frame.
    (let ((frame-name (if top-window
			  (conc top-window '.submodule)
			  '.submodule)))
      (unless (winfo :exists frame-name :return 'boolean)
	(frame frame-name :borderwidth 4
	       :bg "gray"
	       :relief "raise")
	(scrollbar (conc frame-name '.scroll)
		   :relief "sunken"
		   :command
		   (tk-conc frame-name ".list yview"))
	(listbox (conc frame-name '.list)
		 :yscroll (tk-conc frame-name ".scroll set")
		 :relief "sunken" :geometry "20x4" :setgrid 1)
	(label (conc frame-name '.label)
	       :text "Submodules"
	       :font :Adobe-times-bold-r-normal-*-80-*
	       :bg "gray"))
      (pack frame-name :side "left")
      (pack (conc frame-name '.label) :side "top")
      (pack (conc frame-name '.list)
	    (conc frame-name '.scroll)
	    :side "left" :fill "y")
      (funcall (conc frame-name '.list) :delete 0 "end")
      (apply (conc frame-name '.list)
	     :insert 0 sub-names))))

;;# mkDialog w msgArgs list list '...
(in-package "TK")
;;
;; Create a dialog box with a message and any number of buttons at
;; the bottom.
;;
;; Arguments:
;;    w -	Name to use for new top-level window.
;;    msgArgs -	List of arguments to use when creating the message of the
;;		dialog box (e.g. :text, justifcation, etc.)
;;    list -	A two-element list that describes one of the buttons that
;;		will appear at the bottom of the dialog.  The first element
;;		gives the text to be displayed in the button and the second
;;		gives the command to be invoked when the button is invoked.

(defun mkDialog (w msgArgs &rest  args) 
    (if (winfo :exists w :return 'boolean) (destroy w))
    (toplevel w :class "Dialog")
    (wm :title w "Dialog box")
    (wm :iconname w "Dialog")

    ;; Create two frames in the main window. The top frame will hold the
    ;; message and the bottom one will hold the buttons.  Arrange them
    ;; one above the other, with any extra vertical space split between
    ;; them.

    (frame (conc w '.top) :relief "raised" :border 1)
    (frame (conc w '.bot) :relief "raised" :border 1)
    (pack (conc w '.top) (conc w '.bot) :side "top" :fill "both" :expand "yes")

    ;; Create the message widget and arrange for it to be centered in the
    ;; top frame.
    
    (apply 'message (conc w '.top.msg) :justify "center" 
	    :font :Adobe-times-medium-r-normal--*-180* msgArgs)
    (pack (conc w '.top.msg) :side "top" :expand "yes" :padx 3 :pady 3)

    ;; Create as many buttons as needed and arrange them from left to right
    ;; in the bottom frame.  Embed the left button in an additional sunken
    ;; frame to indicate that it is the default button, and arrange for that
    ;; button to be invoked as the default action for clicks and returns in
    ;; the dialog.

    (if (> (length args)  0)
	(let ((i 1) arg)
	  (setq arg (nth 0  args))
	  (frame (conc w '.bot.0) :relief "sunken" :border 1)
	  (pack (conc w '.bot.0) :side "left" :expand "yes" :padx 10 :pady 10)
	  (button (conc w '.bot.0.button) :text (nth 0 arg)
		  :command `(progn ,(nth 1 arg)(destroy ',w)))
	  (pack (conc w '.bot.0.button) :expand "yes" :padx 6 :pady 6)
	  (bind w "<Return>" `(progn ,(nth 1 arg)(destroy ',w)))
	  (focus w)
	  (dolist (arg (cdr args))
		  (setq i (+ i 1))	
		  (button (conc w '.bot. i) :text (nth 0 arg)
			  :command `(progn ,(nth 1 arg)(destroy ',w)))
		  (pack (conc w '.bot. i) :side "left" :expand "yes" :padx 10)
		  
		  )
	  ))
    (bind w "<Any-Enter>" `(focus ',w))
    (focus w)
)

;;;
;;; TOPLEVEL
;;;
(defun chaos::display-toplevel ()
())

