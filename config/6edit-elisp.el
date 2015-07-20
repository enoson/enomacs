(add-hook 'emacs-lisp-mode-hook 'setup-elisp)

(defun setup-elisp ()
  (aggressive-indent-mode t)
  (setq company-backends '((company-yasnippet company-elisp company-capf company-abbrev)))
  (company-mode t))

(defun describe-at-point ()
  (interactive)
  (if (symbolp (variable-at-point))
      (describe-variable (symbol-at-point))
    (describe-function (symbol-at-point))))

(defadvice message (after message-tail activate)
  "goto point max after a emessage"
  (with-current-buffer "*Messages*"
    (goto-char (point-max))
    (walk-windows (lambda (window)
                    (if (string-equal (buffer-name (window-buffer window)) "*Messages*")
                        (set-window-point window (point-max))))
                  nil
                  t)))
