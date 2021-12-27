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
  ;; add other C++ bindings here.
)
(add-hook 'c++-mode-hook 'c++-key-overides)

;;;; Google style guide
;; Provide the styling guide.
(add-hook 'c-mode-common-hook 'google-set-c-style)
;; Indent properly.
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; enable desktop sessions
(desktop-save-mode 1)

;; Set default python shell
(setq python-shell-interpreter "python3")

;; ido-mode
(ido-mode t)

;; compilation-mode
(setq compilation-scroll-output t)

;; ansi colors for eshell and compilation-mode
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'eshell-preoutput-filter-functions
	  'ansi-color-filter-apply)


;; Clipboard
;; The "primary" clipboard is the center mouse click, while the
;; "clipboard" is copied with ctrl-c. Both can be enablled.
(setq select-enable-primary t)
(setq select-enable-clipboard t)
(delete-selection-mode)
