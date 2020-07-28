;; init file for org-mode

(require 'org)
;;---------bullets------------
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; ------key-map-set-----
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)



(general-define-key
 :keymaps 'org-mode-map
 "C-j" 'org-next-visible-heading
 "C-k" 'org-previous-visible-heading
 "," 'hydra-org/body
 )


(defhydra hydra-org()
 "

hydra-python

;; _Va_: pyenv   _sb_: send   _yn_: yas     _sb_: sendBUffer
;; _ll_: faster  _ls_: LSPui  _ld_: LSPDoc  _SB_: temp
;; _sr_: temp    _Vw_: workon _Vd_: deact   _=_: formation
;; _sf_: senFun  _sF_: temp   _sR_: temp
_sa_: outline-show-all
  

"
("sa" outline-show-all)
  
    )


;; (evil-define-minor-mode-key 'normal 'lsp-mode (kbd ",") 'hydra-python/body)
;; (evil-define-key 'normal 'org-mode-map (kbd "<SPC> m") 'hydra-python/body)


;; ======= provide =======
(provide 'init-org)
