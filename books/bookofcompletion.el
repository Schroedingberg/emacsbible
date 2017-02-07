;; The one who uses Emacs will always want everything autocompleted, of course!

(use-package company
  :demand t
  :commands company-mode
  :config
  ;; Enable company-mode globally.
  (global-company-mode)
  ;; Except when you're in term-mode.
  (setq company-global-modes '(not term-mode))
  ;; Give Company a decent default configuration.
  (setq company-minimum-prefix-length 2
	company-idle-delay 0.1
        company-selection-wrap-around t
        company-show-numbers t
        company-tooltip-align-annotations t
        company-require-match nil
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case t)

  ;; Sort completion candidates that already occur in the current
  ;; buffer at the top of the candidate list.
  (setq company-transformers '(company-sort-by-backend-importance company-sort-by-occurrence))
  ;; Show documentation where available for selected completion
  ;; after a short delay.
  (use-package company-quickhelp
    :config
    (setq company-quickhelp-delay 1)
    (company-quickhelp-mode 1))
  ;; Add a completion source for emoji. 😸
  (use-package company-emoji
    :config
    (company-emoji-init))
  ;; Add special company backends
  (use-package company-math)
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  :diminish company-mode
  )




(use-package smartparens
  :init
  (smartparens-global-mode 1)
  (show-smartparens-global-mode 1)
  (require 'smartparens-config)
  :config
  (require 'smartparens-hydra)
  :bind
  ("C-M-a" . sp-beginning-of-sexp)
  ("C-M-e" . sp-end-of-sexp)
  ("C-x p" . hydra-smartparens/body)
  
  )

(use-package semantic
:config
(semantic-mode t))
(use-package srefactor)
  




(provide 'bookofcompletion)
  
