(add-to-list 'auto-mode-alist '("\\.json$". js2-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'". js2-mode))

(setq js2-highlight-level 3
      js2-basic-offset 2
      js2-auto-indent-p t
      js2-highlight-external-variables t
      js2-strict-missing-semi-warning nil
      js2-mode-show-strict-warnings nil)

(add-hook 'js2-mode-hook
          (lambda ()
            (setq company-backends '((company-yasnippet company-tern))
                  tern-command '("tern" "--no-port-file" "--port 50595")
                  prettify-symbols-alist '(("function". ?ƒ)
                                           ("function*". ?λ)
                                           ("var". ?γ)
                                           ("return". ?⬆)
                                           ("==". ?≡)
                                           ("!=". ?≠)
                                           (">=". ?≥)
                                           ("<=". ?≤)
                                           ("&&". ?∧)
                                           ("||". ?∨)
                                           ("null". ?∅)))
            (prettify-symbols-mode t)
            (subword-mode t)
            (tern-mode t)
            (company-mode t)))
