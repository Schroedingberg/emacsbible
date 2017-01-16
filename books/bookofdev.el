(use-package realgud
  :pin melpa)


(use-package cask)
(use-package cask-mode)
(use-package caskxy
  :config
  (setq caskxy--cask-location "/usr/bin/cask"))


(use-package flycheck-package)
(provide 'bookofdev)
