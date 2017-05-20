;; packages.el
;; Add all required packages to the required-packages list. Attempts to install any unintstalled packages.

;; Add packages here:
(setq required-packages
      '(flymake-easy
	flymake-google-cpplint
	ggtags
	iedit
	popup
	sr-speedbar
	yasnippet
	auto-complete
	auto-complete-c-headers
	company
	company-c-headers	
	))

;; Install all packages from the list.
(defun try-installing-package(package)
  "Install a package if not installed already."
  (if (not (package-installed-p package))
      (progn
	(package-install package)
	(message "Installed package %s!" package))))
(mapc 'try-installing-package required-packages)
