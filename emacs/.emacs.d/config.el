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
