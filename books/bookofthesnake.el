(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(use-package elpy
  :init
  (setq elpy-rpc-python-command "python3")
  (setq )
  :config
  (elpy-enable)
  )


(defhydra hydra-pyvenv (python-mode-map "C-c v")
  "Python virtual environments"
  ("a" pyvenv-activate "Activate")
  ("d" pyvenv-deactivate "Deactivate")
  ("w" pyvenv-workon)
  )

