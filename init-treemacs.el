
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
(setq treemacs-filewatch-mode nil)

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
