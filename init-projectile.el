
(general-define-key
 :states '(normal motion)
 :keymaps 'override
 :prefix "SPC"
"p" 'projectile-command-map
)



;; ------- evil global -------
;; (evil-leader/set-key
;;     "p" 'projectile-command-map
    
;; )

(projectile-mode +1)
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)







(provide 'init-projectile)
