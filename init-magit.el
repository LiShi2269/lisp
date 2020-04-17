



(require 'magit)
(require 'evil-magit)

(general-define-key
 :states  '(normal motion)
 :keymaps 'override
 :prefix "SPC"
"gs" 'magit-status
)


;; (evil-leader/set-key
;;     "gs" 'magit-status
;; )

;; (add-hook 'magit-mode-hook)
(define-key magit-mode-map (kbd "C-j") 'magit-next-line)
(define-key magit-mode-map (kbd "C-k") 'magit-previous-line)

(provide 'init-magit)
