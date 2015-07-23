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

(push 'backward-delete-char-untabify company-begin-commands)
(define-key company-active-map [escape] 'company-abort)
(define-key company-active-map [tab] 'company-complete-selection)
(define-key company-active-map [return] 'company-complete-common-or-cycle)

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

(defun comment-or-uncomment-region-or-line ()
  (interactive)
  (if (region-active-p)
      (setq beg (region-beginning) end (region-end))
    (setq beg (line-beginning-position) end (line-end-position)))
  (comment-or-uncomment-region beg end))

;; snippet
(yas-global-mode t)

(setq yas-new-snippet-default
      "#key: $1
       # --
       $0")

(defun find-snippet ()
  (interactive)
  (let ((dir default-directory)
        (yas-dir (concat (car (yas-snippet-dirs)) "/" (symbol-name major-mode) "/")))
    (cd yas-dir)
    (call-interactively 'helm-find-files)
    (if (derived-mode-p 'fundamental-mode)
        (snippet-mode)
      (cd dir))
    (if (= 1 (point-max))
        (yas-expand-snippet yas-new-snippet-default)
      (beginning-of-buffer)
      (search-forward "key: ")
      (end-of-line))))

(bind-key "C-H-M-S"
          (lambda () (interactive)
            (yas-load-snippet-buffer-and-close (car (yas--compute-major-mode-and-parents buffer-file-name))))
          snippet-mode-map)
