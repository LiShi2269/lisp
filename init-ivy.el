

(ivy-mode 1)
(setq ivy-use-virtual-buffers nil)
(setq ivy-count-format "(%d/%d) ")


(define-key ivy-minibuffer-map (kbd "C-j") 'ivy-next-line)
(define-key ivy-minibuffer-map (kbd "C-k") 'ivy-previous-line)





;; ======= provide ======
(provide 'init-ivy)
