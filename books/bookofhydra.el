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


(defhydra hydra-smartparens (global-map "C-x p")
  "Manipulate parentheses"
  ("s" sp-splice-sexp "Splice")
  ("r" sp-rewrap-sexp "Rewrap")
  ("c" sp-convolute-sexp "Convolute"))



