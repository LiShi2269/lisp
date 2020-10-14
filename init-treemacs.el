(use-package treemacs
  :ensure t
  :init
(setq treemacs-width 39)
(setq treemacs-show-cursor nil)
:bind
(:map treemacs-mode-map
 ;; ([f4] . (lambda()(interactive)(message "test"))))
 ("C-<return>" . (lambda()(interactive)(progn (treemacs-RET-action)(treemacs)))))
 ;; ("C-<return>" . 'treemacs))
 ;; ([f4] . (lambda()(interactive)(message "test"))))
  )




;; Treemacs是独立于winum之外的
;; Treemacs可以用鼠标
(define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
;; 设置treemacs的宽度
(setq treemacs-width 39)
(setq treemacs-show-cursor nil)
;; git?
;; (treemacs-git-mode 'simple)
;; (treemacs-git-mode 'deferred)




(provide 'init-treemacs)
