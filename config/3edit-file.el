(setq helm-buffers-fuzzy-matching t
      helm-M-x-fuzzy-match t
      helm-recentf-fuzzy-match helm-buffers-fuzzy-matching helm-imenu-fuzzy-match t
      helm-adapt t
      helm-adaptive-history-file "~/.emacs.d/persist/helm-adaptive-history"
      helm-echo-input-in-header-line t
      recentf-max-saved-items 150
      recentf-save-file "~/.emacs.d/persist/recentf"
      bookmark-default-file "~/.emacs.d/persist/bookmarks"
      projectile-require-project-root nil
      auto-save-buffers-enhanced-quiet-save-p t
      neo-theme 'ascii
      neo-banner-message nil)

(require 'helm-config)
(helm-mode 1)
(helm-adaptative-mode t)
(auto-save-buffers-enhanced t)

(defun find-file-home ()
  (interactive)
  (setq dir default-directory)
  (cd "~")
  (unwind-protect
      (call-interactively 'find-file)
    (cd dir)))

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer's file not exist")
        (let ((new-name (read-file-name "New name: " )))
          (cond
            ((vc-backend filename) (vc-rename-file filename new-name))
            (t
             (rename-file filename new-name t)
             (set-visited-file-name new-name t t)))))))

(defun delete-file-and-buffer ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer's file not exist" name)
      (when (y-or-n-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun go-bookmark () (interactive)
			 (bookmark-maybe-load-default-file)
       (call-interactively 'list-bookmarks)
       (setq kd (key-description (read-key-sequence "Goto one key bookmark:")))
       (unless (equal "<escape>" kd)
         (bookmark-jump kd))
       (kill-buffer "*Bookmark List*"))

(defun set-bookmark () (interactive)
       (call-interactively 'list-bookmarks)
       (let ((k (read-key-sequence "Set one key bookmark:")))
         (kill-buffer "*Bookmark List*")
         (bookmark-set (key-description k))))
