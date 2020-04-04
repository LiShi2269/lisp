;; (global-set-key (kbd "C-x g") 'magit-status)
(require 'magit)
;; (global-magit-file-mode t)
(evil-leader/set-key
    "gs" 'magit-status
)

;; (add-hook 'magit-mode-hook)
(define-key magit-mode-map (kbd "C-j") 'magit-next-line)
(define-key magit-mode-map (kbd "C-k") 'magit-previous-line)

(provide 'init-magit)
