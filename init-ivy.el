

(use-package ivy
  ;; :diminish ivy-mode
  :init
  :config
  (ivy-mode 1)
    (setq ivy-count-format "(%d/%d) ")
    (setq ivy-use-virtual-buffers nil)
	  )



;; ======= provide ======
(provide 'init-ivy)
