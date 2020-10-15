(use-package treemacs
  :ensure t
  :init
(setq treemacs-width 39)
(setq treemacs-show-cursor nil)
:bind
(:map treemacs-mode-map
 ;; ([f4] . (lambda()(interactive)(message "test"))))
 ("C-<return>" . (lambda()(interactive)(treemacs-RET-action))))
("<return>" . (lambda()(interactive)(progn (treemacs-RET-action)(treemacs))))
)
 ;; ("C-<return>" . 'treemacs))
 ;; ([f4] . (lambda()(interactive)(message "test"))))
  
;; (treemacs-load-all-the-icons-with-workaround-font  "Hermit")



;; Treemacs是独立于winum之外的
;; Treemacs可以用鼠标
(define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
;; 设置treemacs的宽度
(setq treemacs-width 39)
(setq treemacs-show-cursor nil)
;; git?
;; (treemacs-git-mode 'simple)
;; (treemacs-git-mode 'deferred)



(use-package spaceline-all-the-icons 
  :after spaceline
  :config (spaceline-all-the-icons-theme)

  )
;; (spaceline-all-the-icons--setup-anzu)            ;; Enable anzu searching
;; (spaceline-all-the-icons--setup-package-updates) ;; Enable package update indicator
;; (spaceline-all-the-icons--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git
;; (spaceline-all-the-icons--setup-paradox)         ;; Enable Paradox mode line
;; (spaceline-all-the-icons--setup-neotree)         ;; Enable Neotree mode line

(provide 'init-treemacs)
