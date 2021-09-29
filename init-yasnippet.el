




(setq yas-snippet-dirs
      '("c:/HOME/.emacs.d/lisp/yas/"
        ))
;; (define-key yas-minor-mode-map (kbd "M-/") 'yas-expand-from-trigger-key)
(require 'yasnippet)
(yas-global-mode 1)


;; ======= provide =======
(provide 'init-yasnippet)
