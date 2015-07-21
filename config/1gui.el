;; fix default
(scroll-bar-mode 0)
(tool-bar-mode 0)
(fringe-mode 0)

;; theme,font
(load-theme 'base16-ocean-dark t)
(if (find-font (font-spec :name "Inconsolata"))
    (set-frame-font "Inconsolata 12"))

;; highlight
(global-hl-line-mode t)
(show-paren-mode t)
(when (display-graphic-p)
  (require 'highlight-tail)
  (setq highlight-tail-colors '(("#bc2525" . 0))
        highlight-tail-steps 15
        highlight-tail-timer 0.02
        ighlight-tail-defaultbgcolor-timer nil)
  (highlight-tail-mode t))

;; window
(setq frame-title-format '("%+%+  " (:eval (int-to-string (point))) "P  %I   %f"))
(add-to-list 'default-frame-alist '(alpha 98 98))
(defun toggle-transparency ()
  (interactive)
  (setq default-transparency-n 98)
  (if (= (car (frame-parameter nil 'alpha)) default-transparency-n)
      (set-frame-parameter nil 'alpha '(85 100))
    (set-frame-parameter nil 'alpha (list default-transparency-n 100))))

;; window popup
(require 'popwin)
(popwin-mode )
(push "*Backtrace*" popwin:special-display-config)
(push '("*Help*" :position left :width 75 :dedicated t) popwin:special-display-config)
(setq helm-display-function (lambda (buf) (switch-to-buffer buf)))

;; window default layout
(add-hook 'window-setup-hook 'default-layout)
(defun default-layout ()
  (interactive)
  (delete-other-windows)
  (neotree-dir "~/.emacs.d")
  (next-multiframe-window)
  (split-window-horizontally)
  (next-multiframe-window)
  (find-file "~/.emacs.d/config/2key-simultaneous.el"))

;; modeline
(require 'sml-modeline)
(sml-modeline-mode t)
(set-face-attribute 'sml-modeline-vis-face nil :background "#3399CC")

(setq-default
 mode-line-format '(:eval (render-mode-line (list mode-line-position "/ " (total-line) "  W" (total-word))
                                            '(" " vc-mode " " mode-line-modes)))
 sml-modeline-len 25)

(defun render-mode-line (left right)
  (setq left-str (format-mode-line left)
        right-str (format-mode-line right)
        left-w (string-width left-str)
        right-w (string-width right-str)
        spc-w (- (window-width) left-w right-w))
  (if (< spc-w 0) (setq spc-w 0))
  (list left (make-string spc-w (string-to-char " ")) right))

(defun total-line ()
  (int-to-string (line-number-at-pos (point-max))))

(defun total-word ()
  (int-to-string
   (if mark-active
       (count-words (region-beginning)(region-end))
     (count-words (point-min) (point-max)))))

;; modeline abbr
(setq mode-line-cleaner-alist
      `((auto-complete-mode . " AC")
        (company-mode . " CA")
        (eldoc-mode . " doc")
        (helm-mode . " H")
        (hl-paren-mode . " HP")
        (paredit-mode . " λ")
        (smartparens-mode . " SP")
        (undo-tree-mode . " U")
        (visual-line-mode . " VL")
        (yas-minor-mode . " Y")
        (emacs-lisp-mode . "EL")
        (js2-mode . "JS")
        (org-mode . "Org")
        (python-mode . "π")))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)
(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                  (mode-str (cdr cleaner))
                  (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
               (setcar old-mode-str mode-str))
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))
