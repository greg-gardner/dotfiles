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



;;;;;;;;;;;; GG ;;;;;;;;;;;;;;;
;; REPOSITORIES
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)
;;

;;;;;;;;;;;;; FUNCTIONS ;;;;;;;;;;;;;;;;;;
(defun ifndef(s)
  (interactive "s#ifndef: " s) ;; prompts for argument with M-x
  (beginning-of-buffer)
  (insert "#ifndef " s "\n")
  (insert "#define " s "\n\n")
  (end-of-buffer)
  (insert "\n\n#endif")
  (previous-line)(previous-line)
  )

(defun class(s)
  (c++-mode)
  (interactive "sClass Name: " s)
  (insert "class " s "{ \n")
  (insert "public: \n")
  (insert s "();\n")
  (insert "~" s "();\n\n")
  (insert "private: \n\n")
  (insert "}\n")
  (indent-region (point-min) (point-max))
  )
  
