
(ivy-mode 1)
(setq ivy-use-virtual-buffers nil)
(setq ivy-count-format "(%d/%d) ")


(define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
(define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)
















;; (require 'ivy-posframe)
;; (ivy-posframe-display-at-frame-center 1)
;; (ivy-posframe-mode 1)
;; (setq evil-want-minibuffer t)
;; (ivy-posframe-mode 1)
;; (ivy-posframe-display-at-frame-bottom-left 1)
;; (ivy-posframe-display-at-point 1)

;; ======= provide ======
(provide 'init-ivy)
