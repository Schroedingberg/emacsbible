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
	 ("M-y" . helm-show-kill-ring))
  :init  (setq helm-buffers-fuzzy-matching t
	       helm-recentf-fuzzy-match    t
	       helm-M-x-fuzzy-match t
	       helm-ff-search-library-in-sexp t)  )
(helm-mode)



(use-package helm-descbinds
  :bind ("C-h b" . helm-descbinds))

(use-package helm-projectile)

(use-package hydra)
(defhydra hydra-goto-line (goto-map ""
                           :pre (linum-mode 1)
                           :post (linum-mode -1))
  "goto-line"
  ("g" goto-line "go")
  ("m" set-mark-command "mark" :bind nil)
  ("q" nil "quit"))
