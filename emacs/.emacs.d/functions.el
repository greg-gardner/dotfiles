
;;;;;;;;;;;;; FUNCTIONS ;;;;;;;;;;;;;;;;;;
;;; These often get called in my shortcuts.el
;;; --GRG

;; Comment line
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
 
;; "newline" hotkey
(defun newline-fresh ()
  "GG-- Create a fresh newline at end of current line."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent)
)

;; Delete current line.
(defun kill-current-line ()
  "Kill whole line."
  (interactive)
  (move-beginning-of-line 1)
  (kill-line 1)
  )

;; Scrolling <^v>
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
(defalias 'scroll-ahead  'scroll-up)
(defalias 'scroll-behind 'scroll-down)

;; Eval-current line
(defun eval-current-line ()
  "Move cursor to end of line before evaluating last sexp."
  (interactive)
  (move-end-of-line 1)
  (eval-last-sexp nil)
  )

;; sudo-edit
(defun sudo-edit ()
  "Use tramp to modify the current buffer with sudo."
  (interactive)
  (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name)))

;; edit-through
(defun edit-through ()
  "Enter a remote directory as current user."
  (interactive)
  (let ((hostname (read-string "Enter hostname :"))
	(path (read-string "Enter directory:")))
    (find-file 
     (concat "/ssh:" user-login-name "@" hostname ":" path))))

;; sudo-through
(defun sudo-through ()
  "Enter a directy as root on a host that does not PermitRootLogin, but does 
allow sudo escalation without password"
  (interactive)
  (let ((hostname (read-string "Enter hostname :"))
	(path (read-string "Enter directory:")))
    (find-file 
     (concat "/ssh:" hostname "|sudo:" hostname ":" path))))

;; Open bash dotfiles in shell-script-mode
(defadvice find-file (before bash-dotfile activate compile)
  "Open '.bash*' dotfiles in shell-script-mode."
  (if buffer-file-name
     (if (or
       (string-match-p ".*\.bash" buffer-file-name)
       (string-match-p "rc.local" buffer-file-name))
      (shell-script-mode))))

;;;;;;;; C-Functions ;;;;;;;;;;;;;;;
;; No idea...
(defun ifndef(s)
  (interactive "s#ifndef: " s) ;; prompts for argument with M-x
  (beginning-of-buffer)
  (insert "#ifndef " s "\n")
  (insert "#define " s "\n\n")
  (end-of-buffer)
  (insert "\n\n#endif")
  (previous-line)(previous-line)
  )
  
;; Make a class
(defun class(s)
  (c++-mode)
  (interactive "sClass Name: " s)
  (insert "class " s "{ \n")
  (insert "public: \n")
  (insert s "();\n")
  (insert "~" s "();\n\n")
  (insert "private: \n\n")
  (insert "}\n")
  (indent-region (point-min) (point-max))
  )
  
