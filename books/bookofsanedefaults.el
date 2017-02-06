(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode 0)
(tooltip-mode -1)
;; Prevent the cursor from blinking
(blink-cursor-mode 0)
;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
;; Switch of beep sound
(setq visible-bell t)
;; No typing of yes or no 
(fset 'yes-or-no-p 'y-or-n-p)
;; Do not ask whether I want to create a buffer or file
(setq confirm-nonexistent-file-or-buffer nil)
;; Standard key bindings
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "<f12>") 'calc)


;; Backup settings
(let ((backup-dir "~/.cache/tmp/emacs/backups")
      (auto-saves-dir "~/.cache/tmp/emacs/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions nil  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 5    ; keep some new versions
      kept-old-versions 2) ; and some old ones, too
;; Tweak dired a little bit


;; Highlight matching parens
(show-paren-mode 1)
;; You will call this function quite often when tweaking your
;; emacs. Better bind it to a key.
(add-hook 'emacs-lisp-mode-hook ( local-set-key (kbd "C-c C-l") 'eval-buffer))
(provide 'bookofsanedefaults)
