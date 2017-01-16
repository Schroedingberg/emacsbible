;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; Initualize settings for package management
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'package-archives
	     	     '("org" . "http://orgmode.org/elpa/"))

;; Make use-package always resolve dependencies.
(setq use-package-always-ensure t)
;; Read the holy books of configuration
(defmacro read-book (book)
  `(concat "~/.emacs.d/books/" ,book)
  )
(setq library '(bookofnavigation
		bookofcompletion
		bookofcolours
		bookofsanedefaults
		bookofutilities
		bookofdev
		))
(load-file (read-book "bookofdev.el"))
(load-file "~/.emacs.d/books/bookofnavigation.el")
(load-file "~/.emacs.d/books/bookofcompletion.el")
(load-file "~/.emacs.d/books/bookofcolours.el")
(load-file "~/.emacs.d/books/bookofsanedefaults.el")
(load-file "~/.emacs.d/books/bookofutilities.el")
(load-file "~/.emacs.d/books/bookoforg.el")
(load-file "~/.emacs.d/books/bookofcsv.el")
(load-file "~/.emacs.d/books/bookofwriting.el")
(load-file "~/.emacs.d/books/bookofversioncontrol.el")
(load-file "~/.emacs.d/books/bookofsemantic.el")
(load-file "~/.emacs.d/books/bookofhydra.el")
(load-file "~/.emacs.d/books/bookofthesnake.el")
(load-file "~/.emacs.d/books/bookofchecking.el")
(load-file "~/.emacs.d/books/bookofclojure.el")
(load-file "~/.emacs.d/books/bookofcommonlisp.el")
(load-file "~/.emacs.d/books/bookofcommonlisp.el")
(load-file "~/.emacs.d/books/bookofhaskell.el")
(load-file "~/.emacs.d/books/bookofbooks.el")
(load-file "~/.emacs.d/books/bookofstatistics.el")
;;(load-file "~/.emacs.d/books/bookofmessages.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(csv-separators (quote ("," ";")))
 '(custom-safe-themes
   (quote
    ("7485c473334e95534b8aaa238bf6d4b7a12777a6bd3cc14d78b627d806e745c9" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "01ac390c8aa5476078be3769f3c72a9e1f5820c9d9a8e8fcde21d0ff0bbeeec1" default)))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-tags-on-save t)
 '(helm-external-programs-associations (quote (("html" . "firefox") ("pdf" . "evince"))))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m org-bullets org-checklist)))
 '(org-use-property-inheritance t)
 '(package-selected-packages
   (quote
    (leuven-dark-theme parse-csv caskxy cask-mode ess sicp color-theme-sanityinc-tomorrow tomorrow-night-light-theme git-timemachine dictcc helm use-package)))
 '(pdf-misc-print-programm "/usr/bin/gtklp"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
