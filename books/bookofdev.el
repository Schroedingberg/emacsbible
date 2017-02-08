;; Version control
(use-package magit
  :bind (("C-x g" . magit-status)))


(use-package browse-at-remote)

;; Syntax/Convention checking
(use-package flymake)
(use-package flycheck)
;; General debugging
(use-package realgud
  :pin melpa
  :config
  (setq realgud:pdb-command-name "python -m pdb"))

;; Elisp
(use-package cask)
(use-package cask-mode)
(use-package caskxy
  :config
  (setq caskxy--cask-location "/usr/bin/cask"))
(use-package flycheck-package)

;; Python

;; Java
(use-package jdee)
(provide 'bookofdev)
