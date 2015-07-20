(global-undo-tree-mode)
(delq (assq 'undo-tree-mode minor-mode-map-alist) minor-mode-map-alist)
(smartparens-global-mode t)
(require 'smartparens-config)

(setq mc/list-file "~/.emacs.d/persist/mc-lists.el"
      expand-region-fast-keys-enabled nil
      avy-keys (string-to-list "e atrinodsuh(lgkqb,mcyfz")
      avy-all-windows nil)

(defun copy-or-copy-symbol ()
  (interactive)
  (if mark-active
      (kill-ring-save (region-beginning) (region-end))
    (edit-at-point-symbol-copy)))

(defun cut-or-cut-symbol ()
  (interactive)
  (if mark-active
      (kill-region (region-beginning) (region-end))
    (edit-at-point-symbol-cut)))

;; line
(defun forward-delete-line ()
  (interactive)
  (delete-region (point) (point-at-eol)))

(defun backward-delete-line ()
  (interactive)
  (delete-region (point) (point-at-bol)))

(defun insert-line-next ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

;; word
(defun forward-delete-word ()
  (interactive)
  (if (looking-at-p "[[:alpha:]]")
      (edit-at-point-word-delete)
    (delete-region (point) (progn (forward-word) (point)))))

(defun backward-delete-word ()
  (interactive)
  (delete-region (point) (progn (backward-word) (point))))

;; space
(defun backward-delete-to-space ()
  (interactive)
  (delete-region (point) (save-excursion (skip-syntax-backward "^ ") (point))))

(defun forward ()
  (interactive)
  (delete-region (point) (save-excursion (skip-syntax-forward "^ ") (point))))

(defun backward-to-space ()
  (interactive)
  (forward-whitespace -1))

(defun forward-to-space ()
  (interactive)
  (forward-char)
  (forward-whitespace 1)
  (backward-char))

;; other
(defun up-paren ()
  (interactive)
  (--goto-str-beg)
  (backward-up-list))

(defun goto-last-redo ()
  (interactive)
  (setq has-redo (undo-tree-node-next (undo-tree-current buffer-undo-tree)))
  (if has-redo (undo-tree-redo))
  (undo-tree-undo)
  (if has-redo () (undo-tree-redo)))
