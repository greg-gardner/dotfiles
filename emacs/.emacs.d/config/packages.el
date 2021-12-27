;; packages.el
;; Add all required packages to the required-packages list. Attempts to install any unintstalled packages.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; ADD REPOS HERE: ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-archives 
      '(
	("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	;;("marmalade" . "https://marmalade-repo.org/packages/")
	))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;; ADD PACKAGES HERE: ;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq required-packages
      '(iedit
	popup
	sr-speedbar
	yasnippet
	auto-complete
	auto-complete-c-headers
	company
	company-c-headers	
	idle-highlight-mode
	hideshow-org
	flymake-easy
	flymake-google-cpplint
	ggtags
	ansi-color
	))

;; Set http proxy
;; (setq url-proxy-services
;;       '(("no_proxy" . "^\\(localhost\\|10.*\\|*.llan.ll.mit.edu\\)")
;;         ("http" . "llproxy.llan.ll.mit.edu:8080")
;;         ("https" . "llproxy.llan.ll.mit.edu:8080"))
;;       )

;; Install all packages from the list.
(defun try-installing-package(package)
  "Install a package if not installed already."
  (if (package-installed-p package)
      (message "%s is installed." package)
      (progn
	(message (concat "Attempting to install package '%s!" package))
	(package-install package))))
(mapc 'try-installing-package required-packages)


;; Installing a package?  Add it to the list above!
