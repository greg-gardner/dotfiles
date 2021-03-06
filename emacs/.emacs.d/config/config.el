;;;;;;;;;;;;;;;; CONFIG.EL ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;  Just dump other configurations here, whatevs.

;; Org-mode 
(setq org-default-notes-file "~/org/TODO.org")
(setq org-agenda-files (list "~/org"))
(setq org-log-done t)
;; (setq org-capture-templates
;;       '(("t" "Todo" entry (file+headline "~/org/TODO.org" "Tasks")
;; 	 "* TODO %?\n  %i\n  %a")
;; 	("j" "Journal" entry (file+datetree "~/org/TODO.org")
;; 	 "* %?\nEntered on %U\n  %i\n  %a")))

;; Disable terminal bell
(setq ring-bell-function 'ignore)

;; Enable idle-highlight-mode in any programming mode.
(add-hook 'prog-mode-hook (lambda () (idle-highlight-mode t)))


;; C++ Mode
;; Enable header-switching hotkey
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
;; Enable C-d 
(defun c++-key-overides ()
  "Overides keybindings for C++ mode. Used in config.el by a hook function. -- GG"
  ;;(local-set-key (kbd "C-d") 'kill-current-line)
  (define-key (current-global-map) [remap c-electric-delete-forward] 'kill-current-line)
;; add other bindings here.
)
(add-hook 'c++-mode-hook 'c++-key-overides)
