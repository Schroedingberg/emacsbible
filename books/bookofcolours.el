(use-package rainbow-mode)
(rainbow-mode)
;; Colored parentheses
(use-package rainbow-delimiters)
;; Start rainbow-delimiters mode in most programming related modes
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Mode line configuration

(use-package mode-icons
  :config
  (mode-icons-mode t))

;; Themes
;; (use-package leuven-theme
;;   :demand t
;;   :config
;;   (load-theme 'leuven-dark))

(add-to-list 'load-path "~/.emacs.d/site-lisp/jazz-theme/")
(load-library "jazz-theme")

(use-package smart-mode-line
  :config
  (setq sml/theme 'respectful)
  (sml/setup)
  )

(provide 'bookofcolours)
