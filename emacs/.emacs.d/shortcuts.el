;;;;;;;;;;;; shortcuts.el
;;;;;;;;;;;; Store Greg's keyboard shortcuts.

;;;;;;;;;;;;;;;;;; KEY BINDINGS ;;;;;;;;;;;;;;;;;;;;
;; Greg's homegrown
(global-set-key (kbd "C-<left>")  'previous-multiframe-window)
(global-set-key (kbd "C-<right>") 'next-multiframe-window)
(global-set-key (kbd "C-\\")      'toggle-comment-on-line)
(global-set-key "\M-e" 'end-of-buffer)
(global-set-key "\M-a" 'beginning-of-buffer)
(global-set-key [C-tab] 'lisp-complete-symbol)
(global-set-key "\C-d" 'kill-current-line)
(global-set-key "\C-o" 'newline-fresh)
(global-set-key [S-next]  'scroll-left)
(global-set-key [S-prior] 'scroll-right)
(global-set-key [C-next]  'scroll-n-lines-ahead)
(global-set-key [C-prior] 'scroll-n-lines-behind)
(global-set-key "\C-j" 'eval-last-sexp)

;; gtags
(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)



;;;;;;;;;;;;;;;;;;; KEY MAPPINGS ;;;;;;;;;;;;;;;;;;;;;;;;
;; company-mode (auto-completion)
(define-key c-mode-map   [(C-tab)] 'company-complete)
(define-key c++-mode-map [(C-tab)] 'company-complete)


