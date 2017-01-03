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
;; 
;(setq backup-directory-alist `((".*" . ,temporary-file-directory)))

