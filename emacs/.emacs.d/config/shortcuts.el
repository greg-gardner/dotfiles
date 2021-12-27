;;;;;;;;;;;; shortcuts.el
;;;;;;;;;;;; Store Greg's keyboard shortcuts.

;;;;;;;;;;;;;;;;;; KEY BINDINGS ;;;;;;;;;;;;;;;;;;;;
;; Greg's homegrown
(global-set-key (kbd "C-<left>")  'previous-multiframe-window)
(global-set-key (kbd "C-<right>") 'next-multiframe-window)
(global-set-key (kbd "C-\\")      'toggle-comment-on-line)
(global-set-key (kbd "C-\|")      'comment-region)
(global-set-key (kbd "M-e")       'end-of-buffer)
(global-set-key (kbd "M-a")       'beginning-of-buffer)
(global-set-key (kbd "C-d")       'kill-current-line)
(global-set-key (kbd "C-o")       'newline-fresh)
(global-set-key (kbd "<next>")    'scroll-n-lines-ahead)
(global-set-key (kbd "<prior>")   'scroll-n-lines-behind)
(global-set-key (kbd "C-<next>")    'scroll-down-command)
(global-set-key (kbd "C-<prior>")   'scroll-up-command)
(global-set-key (kbd "C-j")       'eval-last-sexp)
(global-set-key (kbd "C-z")       'undo)
(global-set-key (kbd "M-<up>")    'move-line-up)
(global-set-key (kbd "M-<down>")  'move-line-down)
(global-set-key (kbd "C-x C-b")   'buffer-menu)
(global-set-key (kbd "M-k")       'copy-current-line)

;; gtags
(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

;; hideshow-org minor mode
(global-set-key "\C-ch" 'hs-org/minor-mode)

;;;;;;;;;;;;;;;;;;; KEY MAPPINGS ;;;;;;;;;;;;;;;;;;;;;;;;
;; company-mode (auto-completion)
(define-key c-mode-map   [(C-tab)] 'company-complete)
(define-key c++-mode-map [(C-tab)] 'company-complete)


