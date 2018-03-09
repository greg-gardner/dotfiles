
;; What does this key do?
;; C-h k <keys>

;; Bind key to command
(global-set-key "\M-e" 'end-of-buffer)
(global-set-key "\M-a" 'beginning-of-buffer)
(global-set-key [C-tab] 'lisp-complete-symbol)

;; Load file:        M-x load-file
;; Eval expression:  C-x C-e
;; Eval inline:      C-j     ;; Lisp-interaction-mode only (*scratc*)
;; Tab Complete      M-TAB   ;; Lisp-interaction-mode only

;; Simple function
(defun other-window-backward ()  ;; params are actually an empty list
  "Go back to previous window."
  (interactive)  ;; can be invoked with keybinding or minibuffer
  (other-window -1)
  )

(global-set-key "\C-x\C-p" 'other-window-backward)

;; Function with argument
(defun other-window-backward (n) 
  "Go back 'n' previous windows."
  (interactive "p") 
  (other-window (- n))
  )

;; Function with optional argument
(defun other-window-backward (&optional n) ;; &optional is a keyword
  "Go back 'n' previous windows."
  (interactive "p")
  (if n
      (other-window (- n))  ;; if n is not nil
    (other-window -1))      ;; if n is nil  
  )

;; About nil
;; 1)  nil means 'false' for conditionals {if,cond,for,while,and,or,not}
;; 2)  ALL other Lisp expressions are 't' for true.
;; 3)  Nil is an empty list, so nil == ().
;; 4)  Nil is also a symbol.
;; 5)  NEVER assign new variable to nil!

;; Condensing the function
(defun other-window-backward (&optional n)
  (interactive "p")
  (other-window (if n (- n) (-1)))
  )

;; Condense even further!
(defun other-window-backward (&optional n)
  (interactive "p")
  (other-window (- (if n n 1)))
  )

;; Condense EVEN FURTHER w/ logical expressions!
(defun other-window-backward (&optional n)
  (interactive "p")
  (other-window (- (or n 1)))
  )

;; Logic functions
;; 'or'  function returns first non-nil expr in arg list.
(or nil nil 3 2 1) ;; --> returns '3'
;; 'and' function returns last non-nil expr.
(and 1 2 3)   ;; --> returns '3'
(and 1 nil 3) ;; --> returns 'nil'

;; Yet another condensed version.
(defun other-window-backward (&optional n)
  (interactive "P")   ;; Capital "P" means leave prefix  in "raw form"
  (other-window
   (- (prefix-numeric-value n))) ;;Return numeric meaning of raw prefix arg.
)

;; Aliases
(defalias 'scroll-ahead  'scroll-up)
(defalias 'scroll-behind 'scroll-down)

;; Scrolling with arguments.
(defun scroll-n-lines-ahead (&optional n)
  "Scroll one or n lines ahead."
  (interactive "P")
  (scroll-ahead (prefix-numeric-value n))
  )
(defun scroll-n-lines-behind (&optional n)
  "Scroll one or n lines behind."
  (interactive "P")
  (scroll-behind (prefix-numeric-value n))
  )
(global-set-key [S-next]  'scroll-left)
(global-set-key [S-prior] 'scroll-right)
(global-set-key [C-next]  'scroll-n-lines-ahead)
(global-set-key [C-prior] 'scroll-n-lines-behind)

 
;; Cursor to top
(defun cursor-to-top ()
  "Move cursor to top of visible window."
  (interactive)
  (move-to-window-line 0)
  )
(defun cursor-to-bottom ()
  "Move cursor to bottom of visible window."
  (interactive)
  (move-to-window-line -1)
  )
(global-set-key [M-next] 'cursor-to-bottom)
(global-set-key [M-prior] 'cursor-to-top)

;; Delete current line.
(defun kill-current-line ()
  "Kill whole line."
  (interactive)
  (move-beginning-of-line 1)
  (kill-line 1)
  )
(global-set-key "\C-d" 'kill-current-line)

;; Hooks: behaviour when opening a symlink.
(defun read-only-if-symlink ()
  "If file is a symlink, open in readonly mode."
  (if (file-symlink-p buffer-file-name)
      (progn ;; Otherwise, if would execute one line or the other.
	(setq buffer-read-only t)
	(message "Opening symlink in readonly mode.")
	)))
(add-hook 'find-file-hooks 'read-only-if-symlink)

;; Using a lambda for hook...
;; Although it's a bad idea if I want to decouple
;; this "anonymous function" in the future.
(add-hook 'find-file-hooks
	  '(lambda ()
	     (if (file-symlink-p buffer-file-name)
		 (progn ;; Otherwise, if would execute one line or the other.
		   (setq buffer-read-only t)
		   (message "Opening symlink in readonly mode.")
		   )))) 

;; Handling the symlink.  Note to self: don't use these
;; functions ;)
(defun visit-target-instead ()
  "Replace this buffer with a buffer that visits the target link."
  (interactive)
  (if buffer-file-name
      (let (target (file-symlink-p buffer-file-name)))
    (if target
	(find-alternate-file target)
      (error "Not visiting a symlink."))
    (error "Not visiting a file.")))

(defun clobber-symlink ()
  "Replace symlink with copy of this file."
  (interactive)
  (if buffer-file-name
      (let (target
	    (file-symlink-p buffer-file-name)))
    (if target
	(if (yes-or-no-p
	     (format "Replace %s with %s?"
		     buffer-file-name
		     target))
	    (progn
	      (delete-file buffer-file-name)
	      (write-file buffer-file-name)))
      (error "Not visiting a symlink."))
    (error "Not visiting a file.")))
      

;; Advice: enforce buffer switching to existing buffers only.
(defadvice switch-to-buffer (before existing-buffer activate compile)
  "When interactive, switch to existing buffers only."
  (interactive "b")) ;; "b" only allows existing buffers.

;; Less restrictive advice function
(defadvice switch-to-buffer (before existing-buffer activate compile)
    "When interactive, switch to existing buffers only, 
unless given a prefix arg."
    (interactive
     (list (read-buffer "Switch to buffer: "  ;; read-buffer prompts user
			(other-buffer)        ;; default is your last buffer
			(null current-prefix-arg))))) ;; unless C-u pressed.

;; Cooperating commands
;; Saving history
(defvar unscroll-to nil
  "Text position for next call to the unscroll command.")
;; About Global vars:
;; - Don't need to be declared, but its nice to have a doc string.
;; - defvar does not overwrite var if it exists already.
(defadvice scroll-up (before remember-for-unscroll
			     activate compile)
  "Remember where we started from for 'unscroll'."
  (if (not (eq last-command 'scroll-up))
      (setq unscroll-to (point))))
(defun unscroll ()
  "Jump back to the cursor position stored in 'unscroll-to."
  (interactive)
  (goto-char unscroll-to))


;; Saving history better
(defvar unscroll-point nil)
(defvar unscroll-window-start nil
  "Windowstart for next callto 'unscroll'.")
(defadvice scroll-up (before remember-for-unscroll ;; Replaces old advice
			     activate compile)     ;;  with same name.
  (if (not (eq last-command 'scrollup))
      (progn
	(setq unscroll-point (point))
	(setq unscroll-window-start (window-start)))))
(defun unscroll ()
  "Jump back to the cursor position stored in 'unscroll-to',
and fix window position to 'unscroll-window-start'."
  (interactive)
  (goto-char unscroll-point)
  (set-window-start nil unscroll-window-start))
