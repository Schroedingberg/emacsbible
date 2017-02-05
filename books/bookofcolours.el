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
(use-package leuven-theme
  :demand t
  :config
  (load-theme 'leuven-dark))



;(use-package cyberpunk-theme)
;; (use-package color-theme-sanityinc-tomorrow
;;   :config
;;   (load-theme sanityinc-tomorrow-)
;;   )


(provide 'bookofcolours)
