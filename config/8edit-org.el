(custom-set-faces
 '(org-level-2 ((t (:inherit outline-2 :weight semi-bold ))))
 '(org-level-3 ((t (:inherit outline-3 :weight semi-bold )))))

(add-hook 'org-mode-hook 'setup-org)

(defun setup-org ()
  (interactive)
  (setq ac-ispell-requires 1
        ac-ispell-fuzzy-limit 4
        org-bullets-bullet-list '("●" "•" "○" "○" "○" "◉")
        org-startup-truncated 0
        org-log-done 'time
        org-clock-string "◷"
        org-export-with-toc nil
        line-spacing 0.2)

  (ac-ispell-setup)
  (ac-ispell-ac-setup)
  (define-key ac-completing-map (kbd "RET") nil)
  (define-key ac-completing-map [tab] 'ac-complete)

  (visual-line-mode t)
  (org-bullets-mode t)

  (bind-keys
   :map org-mode-map
   ("C-M-k". outline-insert-heading)
   ("C-M-l". org-insert-subheading)
   ("C-M-;". org-gfm-export-as-markdown)
   ("C-M-'". org-insert-todo-heading-respect-content)
   ("C-M-i". (lambda () (interactive) (insert-org-heading "* ")))
   ("C-M-o". insert-org-up-heading)
   ("C-M-p". org-columns)
   ("C-M-[". org-narrow-to-subtree)
   ("C-M-]". org-open-at-point)
   ("C-M-/". org-overview)
   ("C-M-q". org-do-demote)
   ("C-M-w". org-time-stamp-inactive)
   ("C-M-m". org-toggle-heading)
   ("C-M-v". org-cut-subtree)
   ("C-t". org-move-subtree-up)
   ("C-r". org-move-subtree-down)
   ("C-n". org-promote-subtree)
   ("C-o". org-demote-subtree)
   ([C-i]. org-todo)))

(defun insert-org-heading (head-str)
  (org-insert-heading)
  (backward-delete-line)
  (insert head-str))
