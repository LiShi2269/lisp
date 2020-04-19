




(defhydra hydra-iedit()
   "

   hydra-python

   _C-c_:    Case       _C-i_:    currentLine
   _n_:      next       _C-f_:    currentFunc
   _N_:      prev        _j_:     expendDown
   _<tab>_:  toggle      _k_:     expandUp
                            
"
    (   "C-c" iedit-toggle-case-sensitive)
    (   "n" iedit-next-occurrence)
    (   "N" iedit-prev-occurrence)
    (   "<tab>" iedit-toggle-selection)
    (   "C-i" iedit-restrict-current-line)
    (   "C-f" iedit-restrict-function)
    (   "j" iedit-expand-down-to-occurrence)
    (   "k" iedit-expand-up-to-occurrence)
   )

(general-define-key
:states '(normal motion)
:key-map '(iedit-mode ein:notebook-mode)
"?" 'hydra-iedit/body
 )
;; (evil-define-minor-mode-key '(normal motion) '(iedit-mode ein:notebook-mode) (kbd "?") 'hydra-iedit/body)


(add-hook 'iedit-mode-hook 'hydra-iedit/body)



(provide 'init-iedit)
