
;;;;;;;;;;;;; FUNCTIONS ;;;;;;;;;;;;;;;;;;
;;; These often get called in my shortcuts.el
;;; --GRG

;; Comment line
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position))
  (next-line)
  (move-beginning-of-line 1))
 
;; "newline" hotkey
(defun newline-fresh ()
  "GG-- Create a fresh newline at end of current line."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent)
)

;; Delete current line.
(defun kill-current-line ()
  "Kill whole line. In config.el, I remap c-electric-delete-forward with this."
  (interactive)
  (move-beginning-of-line 1)
  (kill-line 1)
  )

;; Copy current line.
(defun copy-current-line ()
  "Copy the current line to the kill ring."
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
    (kill-line 1)
    (yank)
    ))
  

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
     (concat "/ssh:" hostname ":" path))))

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
;; (defadvice find-file (before bash-dotfile activate compile)
;;   "Open '.bash*' dotfiles in shell-script-mode."
;;   (if buffer-file-name
;;      (if (or
;;        (string-match-p ".*\.bash" buffer-file-name)
;;        (string-match-p "rc.local" buffer-file-name))
;;       (shell-script-mode))))

;; reload ~/.emacs
(defun reload ()
  (interactive)
  (load-file "~/.emacs"))

;; dunno
(defun dunno ()
  (interactive)
  (insert "¯\\_(ツ)_/¯"))

;; Trim a line to 70 chars unless other wise specified.
;; (defun trim-line (&optional len)
  ;; (interactive "d")
  ;; (progn
    ;; (move-beginning-of-line 1)
    ;; (right-char (or len 70))
    ;; (newline)))

;; Move line up/down
;; see https://www.emacswiki.org/emacs/MoveLine
(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))
(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))
(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

;; Disable a mode
(defun global-disable-mode (mode-fn)
  "Disable `MODE-FN' in ALL buffers."
  (interactive "a")
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (funcall mode-fn -1))))

(defun shrug()
  "Paste a shrug emoticon. Why is this functionality important? ¯\\_(ツ)_/¯"
  (interactive)
  (insert "¯\\\\_(ツ)_/¯"))

;; Copy line.
(defun copy-line ()
  (interactive)
  (beginning-of-line)
  (kill-line))

;; Duplicate line.
(defun duplicate-line ()
  (interactive)
  (copy-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

;; Copy and comment
(defun copy-and-comment ()
  (interactive)
  (duplicate-line)
  (previous-line)
  (toggle-comment-on-line)
  (beginning-of-line))

;; start a new line at current position
(defun insert-line-here()
  (interactive)
  (beginning-of-line)
  (newline)
  (previous-line)
  (indent-for-tab-command))




  

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
  
;; Notes
(defun notes ()
  (interactive)
  (find-file "~/Documents/notes/notes.org"))

;; pyhon-shell
;; (defalias 'run-python 'python-shell)


