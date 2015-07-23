(setq keyfreq-file "~/.emacs.d/persist/keyfreq"
      keyfreq-file-lock "~/.emacs.d/persist/keyfreq.lock")
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(defalias 'in 'package-install)
(defalias 're 'package-utils-remove-by-name)
(defalias 'pr 'package-refresh-contents)
(defalias 'ks 'keyfreq-show)
(defalias 'k 'describe-key)
(defalias 'f 'describe-function)
(defalias 'v 'describe-variable)

;; PgDn
(global-set-key [next]
  (lambda () (interactive)
    (condition-case nil (scroll-up)
      (end-of-buffer (goto-char (point-max))))))

(global-set-key [prior]
  (lambda () (interactive)
    (condition-case nil (scroll-down)
      (beginning-of-buffer (goto-char (point-min))))))

;; ESC
(define-key minibuffer-local-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit)

(bind-key [escape] 'toggle-M-x)
(defun toggle-M-x ()
  (interactive)
  (if mark-active
      (deactivate-mark)
    (if popwin:popup-window
        (popwin:close-popup-window)
      (call-interactively 'helm-M-x))))

(require 'help-mode)
(bind-key [escape] (lambda () (interactive) (popwin:close-popup-window) (kill-buffer "*Help*")) help-mode-map) 
(require 'multiple-cursors)
(bind-key [escape] 'mc/keyboard-quit mc/keymap)
