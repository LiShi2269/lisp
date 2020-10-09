;; Treemacs是独立于winum之外的
;; Treemacs可以用鼠标
(define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
;; 设置treemacs的宽度
(setq treemacs-width 25)
(setq treemacs-show-cursor nil)
;; git?
;; (treemacs-git-mode 'simple)
;; (treemacs-git-mode 'deferred)





(provide 'init-treemacs)
