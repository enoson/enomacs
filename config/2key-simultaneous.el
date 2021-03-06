(bind-keys
 ;; space
 ("C-H-M-A". mode-line-other-buffer)
 ("C-H-M-B". kill-this-buffer)
 ("C-H-M-C". find-snippet)
 ("C-H-M-D". helm-mini)
 ("C-H-M-E". nil)
 ("C-H-M-F". helm-projectile)
 ("C-H-M-G". goto-line)
 ("C-H-M-H". helm-multi-files)
 ("C-H-M-I". set-bookmark)
 ("C-H-M-J". delete-trailing-whitespace)
 ("C-H-M-K". go-bookmark)
 ("C-H-M-L". eval-defun)
 ("C-H-M-M". nil)
 ("C-H-M-N". nil)
 ("C-H-M-O". go-bookmark)
 ("C-H-M-P". kill-this-buffer)
 ("C-H-M-Q". nil)
 ("C-H-M-R". find-file-home)
 ("C-H-M-S". kill-this-buffer)
 ("C-H-M-T". mark-whole-buffer)
 ("C-H-M-U". nil)
 ("C-H-M-V". find-file)
 ("C-H-M-W". describe-at-point)
 ("C-H-M-X". delete-window)
 ("C-H-M-Y". nil)
 ("C-H-M-Z". goto-last-redo)
 ("C-H-M-{". nil)
 ("C-H-M-:". comment-or-uncomment-region-or-line)
 ("C-H-M-<". nil)
 ("C-H-M->". split-window-horizontally)
 ("C-H-M-?". nil)
 ("C-H-M-\"". mc/mark-all-like-this)
 ("C-H-M-<return>". nil)

 ;; a
 ("C-H-s". eno-word-copy)
 ("C-H-d". eval-buffer)
 ("C-H-f". avy-goto-char)
 ("C-H-k". eval-defun)
 ("C-H-l". eno-word-cut)
 ("C-H-;". eno-word-paste)
 ("C-H-'". eno-word-goto)
 ("C-H-i". (lambda () (interactive) (switch-to-buffer-other-window "*Messages*")))
 ("C-H-o". (lambda () (interactive) (switch-to-buffer-other-window "*scratch*")))
 ("C-H-p". nil)
 ("C-H-[". nil)
 ("C-H-w". nil)
 ("C-H-e". nil)
 ("C-H-v". nil)

 ;; s
 ("M-F". neotree)
 ("M-K". edit-at-point-symbol-copy)
 ("M-L". edit-at-point-symbol-cut)
 ("M-:". edit-at-point-symbol-paste)
 ("M-\"".eno-symbol-goto)
 ("M-I". eno-symbol-copy)
 ("M-O". eno-symbol-cut)
 ("M-P". eno-symbol-paste)
 ("M-{". eno-symbol-swap)
 ("M-Q". mc/mark-all-like-this-in-defun)
 ("M-E". kill-buffer-and-window)
 ("M-V". nil)

 ;; d
 ("C-M-k". edit-at-point-paren-copy)
 ("C-M-l". edit-at-point-paren-cut)
 ("C-M-;". edit-at-point-paren-paste)
 ("C-M-'". eno-paren-goto)
 ("C-M-i". nil)
 ("C-M-o". nil)
 ("C-M-p". nil)
 ("C-M-[". edit-at-point-paren-dup)
 ("C-M-q". nil)
 ("C-M-w". describe-at-point)
 ("C-M-v". kill-buffer-and-window)

 ;; f
 ("C-K". eno-line-copy)
 ("C-L". eno-line-cut)
 ("C-:". eno-line-comment-to)
 ("C-\"". eno-line-goto)
 ([C-I]. eno-line-copy-to)
 ("C-O". eno-line-cut-to)
 ("C-P". eno-line-paste-to)
 ("C-{". eno-line-delete-to)
 ("C-Q". edit-at-point-line-copy)
 ("C-W". edit-at-point-line-cut)
 ("C-E". edit-at-point-line-paste)
 ("C-R". eno-line-paste)
 ([C-M]. eno-line-copy-from-to)
 ("C-<". eno-line-cut-from-to)
 ("C->". eno-line-paste-from-to)
 ("C-?". eno-line-comment-from-to)
 ("M-:". edit-at-point-symbol-paste)
 ("M-\"".eno-symbol-goto)
 ("M-I". eno-symbol-copy)
 ("M-O". eno-symbol-cut)
 ("M-P". eno-symbol-paste)
 ("M-{". nil)
 ("M-Q". mc/mark-all-like-this-in-defun)
 ("M-E". kill-buffer-and-window)
 ("M-V". nil)
 ;; k
 ("C-H-M-q". edit-at-point-str-copy)
 ("C-H-M-w". edit-at-point-str-cut)
 ("C-M-M-e". edit-at-point-str-paste)
 ("C-H-M-r". edit-at-point-str-delete)
 ("C-H-M-o". eno-str-copy)
 ("C-H-M-p". eno-str-cut)
 ("C-H-M-[". eno-str-paste)

 ;; l
 ("C-H-Q". nil)
 ("C-H-W". nil)
 ("C-H-E". nil)
 ("C-H-R". nil)
 ("C-H-M". nil)
 ("C-H-P". nil)
 ("C-M-{". nil)

 ;; ;
 ("C-H-Q". nil)
 ("C-H-W". nil)
 ("C-H-E". nil)
 ("C-H-R". nil)
 ("C-H-M". nil)
 ("C-H-O". nil)

 ;; '
 ("C-H-M-S-q". nil)
 ("C-H-M-S-w". nil)
 ("C-H-M-S-e". nil)
 ("C-H-M-S-r". nil)
 ("C-H-M-S-m". nil)
 ("C-H-M-S-o". nil)
 ("C-H-M-S-p". nil)

 ;; q
 ("C-H-<f2>". rename-file-and-buffer)
 ("C-H-<f3>". delete-file-and-buffer)
 ("C-H-<f5>". nil)
 ("C-H-<f6>". nil)
 ("C-H-<f7>". nil)
 ("C-H-<f8>". nil)

 ;; w
 ("M-S-<f3>". edit-at-point-defun-copy)
 ("M-S-<f5>". edit-at-point-defun-copy)
 ("M-S-<f6>". edit-at-point-defun-cut)
 ("M-S-<f7>". edit-at-point-defun-paste)
 ("M-S-<f8>". edit-at-point-defun-dup)
 ("M-S-<f9>". edit-at-point-defun-delete)

 ;; e
 ("C-M-<f5>". helm-swoop)
 ("C-M-<f6>". vr/replace)
 ("C-M-<f7>". nil)
 ("C-M-<f8>". nil)

 ;; r
 ("C-S-<f5>". nil)
 ("C-S-<f6>". nil)
 ("C-S-<f7>". nil)
 ("C-S-<f8>". nil)
 )
