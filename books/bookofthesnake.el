(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(use-package elpy
  :pin elpy
  :config
  (setq python-shell-completion-native nil)
  (elpy-enable)
  )


(defhydra hydra-pyvenv (python-mode-map "C-c v")
  "Python virtual environments"
  ("a" pyvenv-activate "Activate")
  ("d" pyvenv-deactivate "Deactivate")
  ("w" pyvenv-workon)
  )


