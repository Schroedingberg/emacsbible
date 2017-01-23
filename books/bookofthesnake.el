(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(use-package elpy
  :pin elpy
  :config
  (elpy-enable)
;  (elpy-use-ipython)
  )


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


