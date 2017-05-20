
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

;; iedit
;; Simultaneous editing with C-;
(require 'iedit) 

;; ggtags
;; Source code navigation with gnu-global.
;; Don't forget to run gtags in project directory.
;; Apparently helm-tags are better, but ain't nobody got time for that.
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode 'emacs-lisp-mode)
              (ggtags-mode 1))))
(setq ggtags-update-on-save t)

;; imenu
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

;; speedbar
(setq speedbar-show-unknown-files t)

;; cc-mode
(require 'cc-mode)

;; company-mode
;; A text completion framework for emacs. The name stands for "complete anything". It uses pluggable back-ends and front-ends to retrieve and display completion candidates.
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-backends (delete 'company-semantic company-backends))
(add-to-list 'company-backends 'company-c-headers)

