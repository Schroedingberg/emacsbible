(use-package dictcc
    :bind ("C-c d" . dictcc))

(use-package ledger-mode
  :config
  (add-to-list 'ledger-reports '("expenses-plot" "report --file %(ledger-file) -j -M reg")))
(use-package pdf-tools
    :config (pdf-tools-install))

(use-package sudo-edit)
(use-package smooth-scrolling
    :config
    (smooth-scrolling-mode t))

(use-package visual-regexp)
(use-package visual-regexp-steroids)

(provide 'bookofutilities)
