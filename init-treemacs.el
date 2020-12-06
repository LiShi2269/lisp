
(require 'treemacs)

(define-key treemacs-mode-map (kbd "<return>")
  (lambda()(interactive)
    (progn (treemacs-RET-action)
	   (treemacs))))

(define-key treemacs-mode-map (kbd "C-<return>") 'treemacs-RET-action)
;; (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)

(setq treemacs-width 39)
(setq treemacs-show-cursor nil)

(setq treemacs-silent-filewatch t)
(setq treemacs-silent-refresh t)

;; test
;; test

(add-hook 'treemacs-update-node (lambda () (kill-buffer "Treemacs Update Single File Process")))



;; Treemacs是独立于winum之外的
;; Treemacs可以用鼠标


;; 设置treemacs的宽度
;; git?
;; (treemacs-git-mode 'simple)
;; (treemacs-git-mode 'deferred)

  







(provide 'init-treemacs)
