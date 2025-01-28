




(setq yas-snippet-dirs
      '("/Users/lishi/.emacs.d/lisp/yas/"
        ))
;; (define-key yas-minor-mode-map (kbd "M-/") 'yas-expand-from-trigger-key)
(require 'yasnippet)
(yas-global-mode 1)
;; ======= provide =======
(provide 'init-yasnippet)
