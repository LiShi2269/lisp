

(use-package ivy
  ;; :diminish ivy-mode
  :init
  :config
  (ivy-mode 1)
    (setq ivy-count-format "(%d/%d) ")
    (setq ivy-use-virtual-buffers nil)
	  )




;; (define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
;; (define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)
;; (define-key ivy-minibuffer-map (kbd "C-d") 'ivy-switch-buffer-kill)
;; (define-key ivy-switch-buffer-map (kbd "C-j") 'ivy-next-line)
;; (define-key ivy-switch-buffer-map (kbd "C-k") 'ivy-previous-line)
;; (define-key ivy-switch-buffer-map (kbd "C-d") 'ivy-switch-buffer-kill)

;; (defun my-ivy-buffer-switch-down()(interactive)
;;        (progn
;; 	 (ivy-switch-buffer)
;; 	 (ivy-next-line)
;; 	 )
;;        )
;; (global-set-key (kbd "C-S-j") 'my-ivy-buffer-switch-down)





;; ==================ivy post frame ====================
;; 不好用
;; (require 'ivy-posframe)
;; ;; display at `ivy-posframe-style'
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
;; ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
;; ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
;; ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-bottom-left)))
;; ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-bottom-left)))
;; ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
;; (ivy-posframe-mode 1)






;; (require 'ivy-posframe)
;; (ivy-posframe-display-at-frame-center 1)
;; (ivy-posframe-mode 1)
;; (setq evil-want-minibuffer t)
;; (ivy-posframe-mode 1)
;; (ivy-posframe-display-at-frame-bottom-left 1)
;; (ivy-posframe-display-at-point 1)

;; ======= provide ======
(provide 'init-ivy)
