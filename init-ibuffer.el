
(general-define-key
 :states  '(normal motion)
 :keymaps 'override
 :prefix "SPC"
    "BB" 'ibuffer
 )


;; (evil-leader/set-key
;;     "BB" 'ibuffer
;; )



(provide 'init-ibuffer)
