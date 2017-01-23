;; The one who uses Emacs will always want everything autocompleted, of course!
(use-package company
  :init
  (setq company-idle-delay 0
	company-echo-delay 0
	company-minimum-prefix-length 2
	company-transformers '(company-sort-by-occurrence
				company-sort-by-backend-importance)))
;; Run the mode
(global-company-mode)

(use-package company-quickhelp
  :config
  (company-quickhelp-mode 1))




(use-package smartparens
  :config
  (smartparens-global-mode 1)
  (show-smartparens-global-mode 1)
  (require 'smartparens-config)
  :bind
  ("C-M-a" . sp-beginning-of-sexp)
  ("C-M-e" . sp-end-of-sexp))
  

(provide 'bookofcompletion)
  
