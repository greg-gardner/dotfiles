;;;;;;;;;;;; shortcuts.el
;;;;;;;;;;;; Store Greg's keyboard shortcuts.

;;;;;;;;;;;;;;;;;; KEY BINDINGS ;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-<left>")  'previous-multiframe-window)
(global-set-key (kbd "C-<right>") 'next-multiframe-window)
(global-set-key (kbd "C-\\")      'toggle-comment-on-line)
;; gtags
(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)
(global-set-key "\C-j" 'newline-fresh)

;;;;;;;;;;;;;;; FUNCTIONS DEFINITIONS ;;;;;;;;;;;;;;;;;;;

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
