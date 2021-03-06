(use-package org
  :pin manual)
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-pomodoro)
(use-package org-dashboard)
(use-package helm-bibtex)
(use-package org-ref)
(setq org-agenda-files
      (quote
       ("~/.org/Food.org"
              "~/.org/JGU.org"
        "~/.org/Organizer.org"
        "~/.org/Birthdays.org"
	"~/.org/gtd.org")))

;; Org Agenda settings

(setq org-agenda-custom-commands
      '(("t" "Next actions list"
	 ((todo "NEXT" )
	  (todo "WAITING")))

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
(setq org-use-property-inheritance t)
(setq org-enforce-todo-checkbox-dependencies t)
(setq org-log-into-drawer t)
;; Refile
(setq org-refile-targets '((org-agenda-files . (:level . 1))
			   (("~/.org/gtd.org") .   (:level . 2))
			   ))
;; Beautify
(setq org-hide-emphasis-markers t)
(setq org-hide-leading-stars 1)
(setq org-fontify-whole-heading-line t)
;; Replace org bullets with nice unicode dots
(font-lock-add-keywords 'org-mode
                        '(("^ +\\([-*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
;(setq org-checkbox '(t (:background "dark slate gray" :foreground "black" :box (:line-width 1 :style released-button) :width extra-expanded)))


(setq org-use-speed-commands t)
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))
;(setq org-latex)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
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
    (sequence "WAITING(w@/!)")
  (sequence "|" "CANCELED(c)")))

  ;; ;; Farben anpassen
(setq org-todo-keyword-faces
      '(("WAITING"  . (:foreground "orange" :weight bold))
	("NEXT" :foreground "#8b2252" :weight Bold)
	("CANCELED"  . shadow)))
;; ;; Capture settings
 (setq org-default-notes-file "~/.org/Organizer.org")
;;  ;;Org Capture templates

(defun make-time-prop ()
  """Returns a property drawer string with inactive timestamp as prop value for property DATE_CAPTURED."""
  (interactive)
  (format ":PROPERTIES:\n:DATE_CAPTURED: %s\n:END:\n" (format-time-string "[%Y-%m-%d %H:%M]")))


;;;; This is a helper function to avoid having to use literal strings inside a string.
(defun replace-minus-with-slash (S)
  (replace-regexp-in-string "-" "/"  S))
(setq org-capture-templates
      '(
        ("i" "GTD Inbox" entry (file+headline  "~/.org/gtd.org" "Inbox")
         "* %^{Title}\n%(make-time-prop)\%i%?")
        ("a" "Appointment" entry (file+headline "~/.org/gtd.org" "Calendar")
         "* %^{Title}\n%(make-time-prop)%^t\n%i%?\n")
        ("j" "Journal" entry (file+datetree "~/.org/Journal.org")
         "* %?\n%i\n")
        ("b" "Birthday" entry (file+headline "~/.org/Birthdays.org" "New Birthdays")
         "* APPT %?\n%t\n%i\n")
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
	 ;; Richtig cool wäre es, wenn man über Helm Konten auswählen könnte (Und nicht nur über die helm-autocompletion aus dem Speicher)
	 ("t" "Workout" entry (file+olp "~/.org/gtd.org" "Habits" "Training" )
	  "* %<%Y-%m-%d>\n %^{SQUAT}p %^{BENCHPRESS}p %^{DEADLIFT}p")
))


;;Export settings
(require 'ox-md)
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
   (haskell . t)
   (gnuplot .t)
   (perl . t)
   (clojure . t)
   (ledger . t)
   (dot . t))))
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
(setq org-ditaa-jar-path "/home/aaron/.emacs.d/ditaa0_9.jar")




(provide 'bookoforg)
