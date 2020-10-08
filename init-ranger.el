

;; ======= ranger =======
(use-package ranger
  :init

(setq ranger-show-hidden t)
(setq ranger-show-literal t)
(setq ranger-parent-depth 2)
(setq ranger-width-parents 0.2)
(setq ranger-max-parent-width 0.3)
(setq ranger-max-preview-size 10)
(setq ranger-dont-show-binary t)
;; ------- delay -------
(setq ranger-footer-delay 0.2)
(setq ranger-preview-delay 0.040)
  )



(provide 'init-ranger)
