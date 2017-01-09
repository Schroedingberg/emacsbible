(use-package rainbow-mode)
(rainbow-mode)
;; Colored parentheses
(use-package rainbow-delimiters)
;; Start rainbow-delimiters mode in most programming related modes
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Highlight Tail
(use-package highlight-tail
  :init
  (setq highlight-tail-colors '(("#Ff4500" . 0)
				 ("#8b0000" . 10)
				 ("#Ff8c00" . 20)
				 ("#Ffa500" . 30)
				 ("#Ffd700" . 40 )
				 )
   ))
(highlight-tail-mode)


;; Mode line configuration

(use-package mode-icons)
(mode-icons-mode)


;; Themes
(use-package leuven-theme)
;; (use-package color-theme-sanityinc-tomorrow
;;   :config
;;   (load-theme sanityinc-tomorrow-)
;;   )


(provide 'bookofcolours)
