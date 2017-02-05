(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/")
	     '("melpa-stable" . "http://stable.melpa.org/packages/"))

(use-package elpy
  :ensure t
  :pin elpy
  :config
  (elpy-enable))
(use-package company-jedi
  :config
  (defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

  (add-hook 'python-mode-hook 'my/python-mode-hook))

(use-package virtualenvwrapper)
(use-package py-autopep8
  :config
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

(use-package flycheck
  :config
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))



(defhydra hydra-pyvenv (python-mode-map "C-c v")
  "Python virtual environments"
  ("a" pyvenv-activate "Activate")
  ("d" pyvenv-deactivate "Deactivate")
  ("w" pyvenv-workon)
  )


(provide 'bookofthesnake)
