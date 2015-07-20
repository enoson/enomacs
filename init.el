(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode)

(cd "~/.emacs.d")
(async-shell-command "cask update" "*Messages*")

(mapc 'load (directory-files "~/.emacs.d/config" t "^[0-9]+.*\.el$"))

;; for debug or disable certain config
;; (load "~/.emacs.d/config/0default")
;; (load "~/.emacs.d/config/1gui")
;; (load "~/.emacs.d/config/2key-combination")
;; (load "~/.emacs.d/config/2key-press")
;; (load "~/.emacs.d/config/2key-simultaneous")
;; (load "~/.emacs.d/config/3edit-file")
;; (load "~/.emacs.d/config/4edit-text")
;; (load "~/.emacs.d/config/5edit-code")
;; (load "~/.emacs.d/config/6edit-elisp")
;; (load "~/.emacs.d/config/7edit-js")
;; (load "~/.emacs.d/config/8edit-org")
