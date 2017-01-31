(use-package rainbow-mode)
(rainbow-mode)
;; Colored parentheses
(use-package rainbow-delimiters)
;; Start rainbow-delimiters mode in most programming related modes
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)



;; Mode line configuration

(use-package mode-icons)
(mode-icons-mode)


;; Themes
(use-package leuven-theme)



;(use-package cyberpunk-theme)
;; (use-package color-theme-sanityinc-tomorrow
;;   :config
;;   (load-theme sanityinc-tomorrow-)
;;   )


(provide 'bookofcolours)
