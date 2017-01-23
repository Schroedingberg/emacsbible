
;; General debugging
(use-package realgud
  :pin melpa)

;; Elisp
(use-package cask)
(use-package cask-mode)
(use-package caskxy
  :config
  (setq caskxy--cask-location "/usr/bin/cask"))
(use-package flycheck-package)

;; Python

;; Java
(use-package meghanada)
(provide 'bookofdev)
