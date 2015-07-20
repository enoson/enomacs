(require 'yasnippet)
(require 'company)
(require 'color)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 5)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

(setq company-minimum-prefix-length 1
      company-idle-delay 0
      ac-auto-start 1
      ac-delay 0
      ac-auto-show-menu 0.2
      ac-comphist-file  "~/.emacs.d/persist/ac-comphist.dat"
      ac-trigger-commands '(backward-delete-char-untabify self-insert-command))

(define-key company-active-map [escape] 'company-abort)
(define-key company-active-map [tab] 'company-complete-selection)
(define-key company-active-map [return] 'company-complete-common-or-cycle)

(yas-global-mode t)
(add-hook 'prog-mode-hook 'setup-code)

(defun setup-code ()
  (setq indent-tabs-mode nil
        tab-width 2
        show-trailing-whitespace t
        paren-face-regexp "[][(){}]")

  (electric-spacing-mode t)
  (prettify-symbols-mode t)
  (paren-face-mode t)
  (hl-paren-mode t)
  (eldoc-mode t))

;; create yasnippet
(setq yas-new-snippet-default
      "# name: $1
       # ---
       $0")

(defun find-snippet ()
  (interactive)
  (let ((dir (concat (car (yas-snippet-dirs)) "/" (symbol-name major-mode) "/")) )
    (find-file (read-string "snippet:" dir))
    (snippet-mode)
    (if (= 1 (point-max))
        (yas-expand-snippet yas-new-snippet-default)
      (beginning-of-buffer)
      (search-forward "key:")
      (end-of-line))))

(define-key snippet-mode-map "C-H-M-S-s"
  (lambda () (interactive)
    (yas-load-snippet-buffer yas--guessed-modes)
    (kill-buffer)))

(defun comment-or-uncomment-region-or-line ()
  (interactive)
  (if (region-active-p)
      (setq beg (region-beginning) end (region-end))
    (setq beg (line-beginning-position) end (line-end-position)))
  (comment-or-uncomment-region beg end))
