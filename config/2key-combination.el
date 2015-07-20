(bind-keys
 ;; first row
 ("H-a". edit-at-point-line-dup)
 ("H-b". other-window)
 ("H-c". copy-or-copy-symbol)
 ("H-d". edit-at-point-line-delete)
 ("H-e". er/expand-region)
 ("H-f". forward-to-space)
 ("H-g". windmove-up)
 ("H-H". windmove-right) ;"H-h" menubar - Emacs - Hide Emacs
 ("H-i". undo-tree-undo)
 ("H-j". nil)
 ("H-k". windmove-down)
 ("H-l". join-line)
 ("H-m". nil)
 ("H-n". undo-tree-redo)
 ("H-o". mc/mark-next-symbol-like-this)
 ("H-p". forward-paragraph)
 ("H-q". kill-emacs)
 ("H-r". edit-at-point-line-down)
 ("H-s". (lambda () (interactive) (join-line -1)))
 ("H-t". edit-at-point-line-up)
 ("H-u". windmove-left)
 ("H-v". yank)
 ("H-w". backward-paragraph)
 ("H-x". cut-or-cut-symbol)
 ("H-y". backward-to-space)
 ("H-z". undo-tree-undo)
 ("H-(". up-paren)
 ("H-[". windmove-up)
 ("H-]". (lambda () (interactive) (sp-wrap-with-pair "(")))
 ("H-.". insert-line-next) ("H-;". linum-mode) ("H-/". toggle-transparency)
 ("H-,". nil)
 ("H-'". nil)
 ("H-<return>". mc/mark-more-like-this-extended)

 ;; fix
 ("M-<delete>". forward-delete-word)
 ("M-<backspace>". backward-delete-word)
 ("H-<left>". beginning-of-line)
 ("H-<right>". end-of-line)
 ("H-<backspace>". backward-delete-line)
 ("H-<delete>". forward-delete-line)
 ("H-Z". undo-tree-redo)
 ([S-mouse-1]. mouse-save-then-kill)
 )

(global-unset-key [S-down-mouse-1])
(define-key input-decode-map [?\C-i] [C-i])
(define-key input-decode-map [?\C-m] [C-m])