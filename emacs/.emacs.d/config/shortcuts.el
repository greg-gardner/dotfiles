 ;;     _            _           _            _
;;  __| |_  ___ _ _| |_ __ _  _| |_ ___  ___| |
;; (_-< ' \/ _ \ '_|  _/ _| || |  _(_-<_/ -_) |
;; /__/_||_\___/_|  \__\__|\_,_|\__/__(_)___|_|


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
(global-set-key (kbd "C-<next>")  'scroll-n-lines-ahead)
(global-set-key (kbd "C-<prior>") 'scroll-n-lines-behind)
(global-set-key (kbd "C-j")       'eval-last-sexp)
(global-set-key (kbd "C-z")       'undo)
(global-set-key (kbd "M-<up>")    'move-line-up)
(global-set-key (kbd "M-<down>")  'move-line-down)
(global-set-key (kbd "C-x C-b")   'buffer-menu)
(global-set-key (kbd "C-l")       'insert-line-here)

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



;;;;;;;;; EXPERIMENTAL SHORTCUT MINOR MODE ;;;;;;;;;;;
;; Default Mode Overides
(defvar gregs-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-<left>")  'previous-multiframe-window)
    (define-key map (kbd "C-<right>") 'next-multiframe-window)
    (define-key map (kbd "C-\\")      'toggle-comment-on-line)
    (define-key map (kbd "C-\|")      'comment-region)
    (define-key map (kbd "M-e")       'end-of-buffer)
    (define-key map (kbd "M-a")       'beginning-of-buffer)
    (define-key map (kbd "C-d")       'kill-current-line)
    (define-key map (kbd "C-o")       'newline-fresh)
    (define-key map (kbd "<next>")    'scroll-n-lines-ahead)
    (define-key map (kbd "<prior>")   'scroll-n-lines-behind)
    (define-key map (kbd "C-<next>")  'scroll-up-command)
    (define-key map (kbd "C-<prior>") 'scroll-down-command)
    (define-key map (kbd "C-j")       'eval-last-sexp)
    (define-key map (kbd "C-z")       'undo)
    (define-key map (kbd "M-<up>")    'move-line-up)
    (define-key map (kbd "M-<down>")  'move-line-down)
    (define-key map (kbd "C-x C-b")   'buffer-menu)
    (define-key map (kbd "C-<tab>")   'hs-toggle-hiding)
    (define-key map (kbd "C-c r")     'reload)
    ;; Insert additional bindings here.
    map)
  "gregs-keys-minor-mode map.")
(define-minor-mode gregs-keys-minor-mode
  "My own minor mode for overiding keybindings in other major modes."
  :init-value t
  :lighter " gregs-keys")
(gregs-keys-minor-mode t)
(add-hook 'after-load-functions 'gregs-keys-have-priority)

(defun gregs-keys-have-priority (_file)
  "Try to ensure that my keybindings retain priority over other minor modes.

Called via the `after-load-functions' special hook."
  (unless (eq (caar minor-mode-map-alist) 'gregs-keys-minor-mode)
    (let ((mykeys (assq 'gregs-keys-minor-mode minor-mode-map-alist)))
      (assq-delete-all 'gregs-keys-minor-mode minor-mode-map-alist)
      (add-to-list 'minor-mode-map-alist mykeys))))

