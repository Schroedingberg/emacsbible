;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; Initualize settings for package management
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
;; Make use-package always resolve dependencies.
(setq use-package-always-ensure t)
;; Read the holy books of configuration
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(csv-separators (quote ("," ";")))
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "01ac390c8aa5476078be3769f3c72a9e1f5820c9d9a8e8fcde21d0ff0bbeeec1" default)))
 '(helm-external-programs-associations (quote (("pdf" . "zathura"))))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m org-bullets org-checklist)))
 '(package-selected-packages (quote (dictcc helm use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
