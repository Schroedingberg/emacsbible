(use-package hydra)
(defhydra hydra-goto-line (goto-map ""
                           :pre (linum-mode 1)
                           :post (linum-mode -1))
  "goto-line"
  ("g" goto-line "go")
  ("m" set-mark-command "mark" :bind nil)
  ("q" nil "quit"))

(defhydra hydra-projectile (global-map "C-c p"
			    :color teal
                :columns 4)
  "Projectile"
  ("f"   helm-projectile-find-file                "Find File")
  ("r"   helm-projectile-recentf                  "Recent Files")
  ("z"   helm-projectile-cache-current-file       "Cache Current File")
  ("x"   helm-projectile-remove-known-project     "Remove Known Project")

  ("d"   helm-projectile-find-dir                 "Find Directory")
  ("b"   helm-projectile-switch-to-buffer         "Switch to Buffer")
  ("c"   helm-projectile-invalidate-cache         "Clear Cache")
  ("X"   helm-projectile-cleanup-known-projects   "Cleanup Known Projects")

  ("o"   helm-projectile-multi-occur              "Multi Occur")
  ("s"   helm-projectile-switch-project           "Switch Project")
  ("k"   helm-projectile-kill-buffers             "Kill Buffers")
  ("q"   nil "Cancel" :color blue))



