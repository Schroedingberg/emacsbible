(setq helm-packages
      '(
        ace-jump-helm-line
        auto-highlight-symbol
        bookmark
        helm
	helm-descbinds
        helm-flx
        helm-make
        helm-mode-manager
        helm-projectile
        helm-swoop
        helm-themes
	imenu
        popwin
        projectile
))


(use-package helm
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-mini)
	 ("C-x C-b" . helm-mini)
	 ("M-y" . helm-show-kill-ring)
	 ("C-S " . helm-occur)
	 ("<f5>" . helm-semantic-or-imenu))
  :config
  (helm-mode)
  (helm-autoresize-mode)
  :init  (setq helm-buffers-fuzzy-matching t
	       helm-recentf-fuzzy-match    t
	       helm-M-x-fuzzy-match t
	       helm-ff-search-library-in-sexp t)  )





(use-package helm-descbinds
  :bind ("C-h b" . helm-descbinds))

(use-package projectile)
(use-package helm-projectile
  :config (projectile-mode 1)
  :init
  (helm-projectile-on)) 

(use-package undo-tree
  :config  (setq undo-tree-visualizer-diff 1)
  (undo-tree-mode)
  :bind ("C-x u" . undo-tree-visualize))

(use-package which-key
  :init
  (setq which-key-idle-delay 0.4)
  :config
  (which-key-mode 1))


(use-package ace-link
  :init
  (ace-link-setup-default))
(use-package ace-window
  :bind ("M-p" . ace-window))
(use-package dired+)


(use-package hydra)


(defhydra hydra-goto-line (goto-map ""
                           :pre (linum-mode 1)
                           :post (linum-mode -1))
  "goto-line"
  ("g" goto-line "go")
  ("m" set-mark-command "mark" :bind nil)
  ("q" nil "quit"))

(defhydra hydra-zoom (global-map "C-c +")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

(provide 'bookofnavigation)
