
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t)
 '(package-archives nil)
 '(package-check-signature nil)
 '(package-selected-packages
   (quote
    (elpy python-test figlet google-c-style flymake-google-cpplint flymake-easy ggtags yasnippet sr-speedbar iedit idle-highlight-mode hideshow-org company-c-headers auto-complete-c-headers)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; backup directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;;;;;;;;;;;; LOAD EVERYTHING ELSE ;;;;;;;;;;
(load "~/.emacs.d/config/packages.el")
(load "~/.emacs.d/config/functions.el")
(load "~/.emacs.d/config/require.el")
(load "~/.emacs.d/config/macros.el")
(load "~/.emacs.d/config/shortcuts.el")
(load "~/.emacs.d/config/config.el")
