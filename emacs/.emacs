(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t)
 '(package-archives nil)
 '(package-check-signature nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load "~/.emacs.d/macros.el")
(load "~/.emacs.d/shortcuts.el")

(put 'erase-buffer 'disabled nil)
 ;; backup directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))



;;;;;;;;;;;; REPOSITORIES  ;;;;;;;;;;;;;;;
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "https://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

;;;;;;;;;;;;; PACKAGES ;;;;;;;;;;;;;;;;;;;

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; auto-complete-c-headers
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-header)
  (add-to-list 'achead:include-directories '"/usr/include")
  ;; There are many more headers to include.
  ;; see "C-x h v achead:include-directories" for details.
  )
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;;;;;;;;;;;;; FUNCTIONS ;;;;;;;;;;;;;;;;;;
;; (defun ifndef(s)
;;   (interactive "s#ifndef: " s) ;; prompts for argument with M-x
;;   (beginning-of-buffer)
;;   (insert "#ifndef " s "\n")
;;   (insert "#define " s "\n\n")
;;   (end-of-buffer)
;;   (insert "\n\n#endif")
;;   (previous-line)(previous-line)
;;   )

;; (defun class(s)
;;   (c++-mode)
;;   (interactive "sClass Name: " s)
;;   (insert "class " s "{ \n")
;;   (insert "public: \n")
;;   (insert s "();\n")
;;   (insert "~" s "();\n\n")
;;   (insert "private: \n\n")
;;   (insert "}\n")
;;   (indent-region (point-min) (point-max))
;;   )
  
