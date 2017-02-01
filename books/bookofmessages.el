;; You need to install mu before you can use this file
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(global-set-key (kbd "C-x m") 'mu4e)

;; Only needed if your maildir is _not_ ~/Maildir
;; Must be a real dir, not a symlink
(setq mu4e-maildir "/home/aaron/.mail")

(setq mu4e-get-mail-command "offlineimap")
;; use 'fancy' non-ascii characters in various places in mu4e
(setq mu4e-use-fancy-chars t)
;; save attachment to my desktop (this can also be a function)
(setq mu4e-attachment-dir "~/Desktop")

;; attempt to show images when viewing messages
(setq mu4e-view-show-images t)



(setq mu4e-drafts-folder "/Entw&APw-rfe")
(setq mu4e-trash-folder "/Gel&APY-schte Elemente")
(setq mu4e-sent-folder "/Gesendete Elemente")

;(setq mu4e- "INBOX")
;(setq mu4e-sp "Junk-E-Mail")
;( "Postausgang")

;; Settings
(setq
  mu4e-index-cleanup nil      ;; don't do a full cleanup check
  mu4e-index-lazy-check t    ;; don't consider up-to-date dirs
  mu4e-compose-in-new-frame t)


;; smtp mail setting; these are the same that `gnus' uses.
;; (setq
;;    message-send-mail-function   'smtpmail-send-it
;;    smtpmail-default-smtp-server "smtp.example.com"
;;    smtpmail-smtp-server         "smtp.example.com"
;;    smtpmail-local-domain        "example.com")
;; SMTP Settings
;; JGU
;; mail.uni-mainz.de, 587, TLS
;; ZOHO
;; smtp.zoho.com, 465, SSL



;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu, 'gnutls' in Archlinux.

(require 'smtpmail)

(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials
      '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials
      (expand-file-name "~/.pw/gmail.gpg")
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t)

(provide-me)
