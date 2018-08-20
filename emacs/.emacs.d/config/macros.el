;;;;;;;;;;;; macros.el
;;;;;;;;;;;; Store Greg's macros.

;; koan_test
;;   switch buffers and run python koans.
(fset 'koan_test
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 111 99 100 32 107 111 97 110 115 47 46 46 return 112 121 116 104 111 110 32 99 111 110 116 101 109 112 108 97 121 backspace 116 101 95 107 111 97 110 115 46 112 121 return 24 111] 0 "%d")) arg)))
