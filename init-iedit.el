



;; (defun my-iedit-set()
;;   (interactive)
;;     (  (kbd "C-c") 'iedit-toggle-case-sensitive)
;;     (  (kbd "C-n") 'iedit-next-occurrence)
;;     (  (kbd "C-N") 'iedit-prev-occurrence)
;;     (  (kbd "<tab>") 'iedit-toggle-selection)
;;     (  (kbd "C-i") 'iedit-restrict-current-line)
;;     (  (kbd "C-f") 'iedit-restrict-function)
;;     (  (kbd "C-k") 'iedit-expand-down-to-occurrence)
;;     (  (kbd "C-j") 'iedit-expand-up-to-occurrence)
;; )

(defhydra hydra-iedit()
   "

   hydra-python

   _C-c_:    pyvenv-activate     _C-i_: send-buffer      
   _n_:      pyvenv-deactivate   _C-f_: and go
   _N_:      pyenv-workon        _j_:   send-region
   _<tab>_:  formatting          _k_:   and go
                            
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





(add-hook 'iedit-mode-hook 'hydra-iedit/body)



(provide 'init-iedit)
