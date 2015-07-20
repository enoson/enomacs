(require 'saveplace)

(setq make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil
      desktop-path '("~/.emacs.d/persist/")
      inhibit-startup-message t
      scroll-preserve-screen-position t
      require-final-newline t
      echo-keystrokes 0.1
      mac-command-modifier 'hyper
      mac-option-modifier 'meta
      ring-bell-function (lambda () (message "*beep*")))

(setq-default
  save-place-file "~/.emacs.d/persist/saveplace"
  save-place t)

(global-auto-revert-mode t)
(delete-selection-mode t)
(desktop-save-mode t)
(blink-cursor-mode 0)

(fset 'yes-or-no-p 'a-or-e)
(fset 'y-or-n-p 'a-or-e)
(defun a-or-e (prompt)
  (let ((a (downcase (read-key-sequence (concat "(a:yes e:no) " prompt)))))
    (cond ((string= a "a") t)
          ((string= a "e") nil)
          (t (a-or-e (concat prompt " #pressed:" a "#"))))))
