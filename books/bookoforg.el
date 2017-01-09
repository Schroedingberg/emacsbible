(use-package org
  :pin manual)


(setq org-agenda-files
      (quote
       ("~/.org/Food.org"
              "~/.org/JGU.org"
        "~/.org/Organizer.org"
        "~/.org/Birthdays.org"
	"~/.org/gtd.org")))

;; Org Agenda settings

(setq org-agenda-custom-commands
      '(("t" todo "NEXT")
	("c" "GTD Overview"
	  ((agenda "")
	  (todo "NEXT")))
	))
;; Give my window view back to me when I am finished with agenda stuff
(setq org-agenda-restore-windows-after-quit t)
;; ;; Tasks mit Datum in der Agenda ausblenden, wenn sie bereits erledigt sind:
(setq org-agenda-skip-deadline-if-done t)
(setq org-deadline-warning-days 7)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-timestamp-if-deadline-is-shown t)
(setq org-agenda-skip-timestamp-if-done t)
(setq org-return-follows-link t)

;; Refile
(setq org-refile-targets '((org-agenda-files . (:level . 1))
			   (("~/.org/gtd.org") .   (:level . 2))
			    ))
(setq org-hide-leading-stars 1)

(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))
(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)
(add-hook 'org-mode-hook 'org-hide-block-all)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key (kbd "<f7>") 'org-clock-out)
(global-set-key (kbd "<f8>") 'org-clock-in-last)
(global-set-key "\C-cb" 'org-iswitchb)


 ;;Org TODO settings
  (setq org-todo-keywords
	 '((sequence "NEXT(n)" "|" "DONE(d)")
	(sequence "TODO(t)" "|" "DONE(d)")
    (sequence "WAITING(w)")
  (sequence "|" "CANCELED(c)")))

  ;; ;; Farben anpassen
(setq org-todo-keyword-faces
      '(("WAITING"  . (:foreground "orange" :weight bold))
	("NEXT" :foreground "#8b2252" :weight Bold)
	("CANCELED"  . shadow)))
;; ;; Capture settings
 (setq org-default-notes-file "~/.org/Organizer.org")
;;  ;;Org Capture templates
;;;; This is a helper function to avoid having to use literal strings inside a string.
(defun replace-minus-with-slash (S)
  (replace-regexp-in-string "-" "/"  S))
(setq org-capture-templates
      '(
        ("i" "GTD Inbox" entry (file+headline  "~/.org/gtd.org" "Inbox")
         "* %?\n Entered on %U\n %i")
        ("a" "Appointment" entry (file+headline "~/.org/gtd.org" "Calendar")
         "* %^{Title}\n %^t\n%?\n \nEntered on %U")
        ("j" "Journal" entry (file+datetree "~/.org/Journal.org")
         "* %?\nEntered on %U\n  %i\n")
        ("f" "Food" entry (file+datetree "~/.org/Food.org" "Food tracking")
         "* %?\n Entered on %U\n %i")
        ("b" "Birthday" entry (file+headline "~/.org/Birthdays.org" "New Birthdays")
         "* APPT %?\n %i\n")
        ;; Inspiriert von
        ;; http://sachachua.com/blog/2010/11/emacs-recording-ledger-entries-with-org-capture-templates/
        ;; wird hier die Macht von Org-Capture benutzt, um häufig auftretende
        ;; Transaktionen schnell und bequem eingeben zu können. Dabei werden die
        ;; Informationen einfach plain an das Ledgerfile angehängt, also nicht
        ;; in ein Org-file geschrieben. Damit sind die Daten zwar nicht direkt
        ;; für org mode verfügbar, aber weil Finanzen und Organisation sehr eng
        ;; zusammenhängen ist es durchaus sinnvoll das zumindest auf diese lose Art zu koppeln.
         ("l" "Ledger entries")
         ("le" "Lebensmittel" plain (file "~/.org/finance.dat")
          "%(replace-minus-with-slash (org-read-date)) %^{Kreditor}
               Ausgaben:Lebensmittel  %^{Betrag} €
               Aktiva:Umlaufvermögen:%^{Konto}" :empty-lines 1)
         ("lp" "Katzen" plain (file "~/.org/finance.dat")
          "%(replace-minus-with-slash (org-read-date)) %^{Kreditor, Artikelbezeichnung}
            Ausgaben:Haustiere %^{Betrag} €
            Aktiva:Umlaufvermögen:%^{Konto}" :empty-lines 1)
         ("lm" "Manuell eintragen" plain (file "~/.org/finance.dat")
          "%(replace-minus-with-slash (org-read-date)) %^{Kreditor, Artikelbezeichnung}
          " :empty-lines 1)
         ;("v" "Lecture notes")
        ; ("v")

;; Richtig cool wäre es, wenn man über Helm Konten auswählen könnte (Und nicht nur über die helm-autocompletion aus dem Speicher)
))


;;Export settings
(setq org-latex-pdf-process
      (quote
       ("xelatex -interaction nonstopmode -output-directory %o %f"
        "biber %b" "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f")))
;; (add-to-list 'load-path "")
;; (require 'ox-latex)
;; (add-to-list 'org-latex-classes
;;              '("koma-article"
;;                "\\documentclass{scrartcl}"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(add-to-list 'load-path "~/.emacs.d/contrib/lisp/")
(require 'ox-koma-letter)

(add-to-list 'org-latex-classes
               '("my-letter"
                 "\\documentclass\[%
  DIV=14,
  fontsize=12pt,
  parskip=half,
  subject=titled,
  backaddress=false,
  fromalign=left,
  fromemail=true,
  fromphone=true\]\{scrlttr2\}
  \[DEFAULT-PACKAGES]
  \[PACKAGES]
  \[EXTRA]"))
(add-to-list 'org-latex-packages-alist '("AUTO" "babel" nil))

(setq org-src-fontify-natively t)





;;Time settings
(setq org-clock-persist 'history)


;;Babel

(setq org-confirm-babel-evaluate nil)   ;don't prompt me to confirm everytime I want to evaluate a block
       ;;; display/update images in the buffer after I evaluate
(setq org-src-tab-acts-natively t)
(setq org-src-preserve-indentation t)
(org-babel-do-load-languages
 'org-babel-load-languages
 (quote
  ((emacs-lisp . t)
   (ditaa . t)
   (python . t)
   (latex . t)
   (sh . t)
   (clojure . t)
   (ledger . t)
   (dot . t))))
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)


(use-package org-pomodoro)


(provide 'bookoforg)
