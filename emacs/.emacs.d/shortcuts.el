;;;;;;;;;;;; macros.el
;;;;;;;;;;;; Store Greg's macros.

;;;;;;;;;;;;;;;;;; KEY BINDINGS ;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-<left>")  'previous-multiframe-window)
(global-set-key (kbd "C-<right>") 'next-multiframe-window)
(global-set-key (kbd "C-\\")      'toggle-comment-on-line)





;;;;;;;;;;;;;;; FUNCTIONS DEFINITIONS ;;;;;;;;;;;;;;;;;;;

;; Comment line
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

 
