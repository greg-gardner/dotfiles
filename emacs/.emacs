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
    (yasnippet sr-speedbar iedit idle-highlight-mode hideshow-org ggtags flymake-google-cpplint company-c-headers cider auto-complete-c-headers arduino-mode)))
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

(defvar test-var nil
  "* This is user-option test.")

;;;;;;;;;;;; LOAD EVERYTHING ELSE ;;;;;;;;;;
(load "~/.emacs.d/config/packages.el")
(load "~/.emacs.d/config/functions.el")
(load "~/.emacs.d/config/require.el")
(load "~/.emacs.d/config/macros.el")
(load "~/.emacs.d/config/shortcuts.el")
(load "~/.emacs.d/config/config.el")
