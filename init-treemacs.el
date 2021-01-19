
(require 'treemacs)

;; (define-key treemacs-mode-map (kbd "<return>")
  ;; (lambda()(interactive)
    ;; (progn (treemacs-RET-action)
	   ;; (treemacs))))

;; (define-key treemacs-mode-map (kbd "C-<return>") 'treemacs-RET-action)
;; (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)

;; (setq treemacs-width 39)
;; (setq treemacs-show-cursor nil)

(setq treemacs-silent-filewatch nil)
(setq treemacs-silent-refresh nil)
;; 路径当中要有python路径才可以
(setq treemacs-filewatch-mode t)
;; 能够相当于word文档的文档结构工具
(setq treemacs-tag-follow-mode t)

;; =-============= 能够自动切换工作空间 =================
;; (use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
;;   :after treemacs persp-mode ;;or perspective vs. persp-mode
;;   :ensure t
;;   :config (treemacs-set-scope-type 'Perspectives))




;; Treemacs是独立于winum之外的
;; Treemacs可以用鼠标


;; 设置treemacs的宽度
;; git?
;; (treemacs-git-mode 'simple)
;; (treemacs-git-mode 'deferred)

  
(setq treemacs-persist-file "/home/lishi/.emacs.d/lisp/treemacs-persist" )






(provide 'init-treemacs)
G
