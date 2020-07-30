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

;; hydra-python

;; _Va_: pyenv   _sb_: send   _yn_: yas     _sb_: sendBUffer
;; _ll_: faster  _ls_: LSPui  _ld_: LSPDoc  _SB_: temp
;; _sr_: temp    _Vw_: workon _Vd_: deact   _=_: formation
;; _sf_: senFun  _sF_: temp   _sR_: temp
;; _sa_: outline-show-all
  

"
;; -------show something--------
("sa" outline-show-all)
("s1" org-set-startup-visibility)
("sc" outline-show-children)
("s2" org-tree-to-indirect-buffer)


;; -------motion--------
("mj" org-forward-heading-same-level)
("mk" org-backward-heading-same-level)
("mu" outline-up-heading)
("mg" org-goto)

;; -------structure--------
("<return>" org-insert-heading-respect-content)
("xs" org-cut-subtree)
("cs" org-copy-subtree)
("cp" org-paste-subtree)
("nb" org-narrow-to-block)
("ns" org-narrow-to-subtree)
("nw" widen)
("*" org-toggle-heading)
("`" org-sort)

;; -------Sparse trees--------
("S/" org-sparse-tree)
("So" org-occur)
("Sj" next-error)
("Sk" previous-error)

;; -------drawer--------
("id" org-insert-drawer)

;; -------drawer--------
("i|" org-table-create-or-convert-from-region)
("tr" org-table-align)
("t<SPC>" org-table-blank-field)
("ct" org-table-copy-region)
("xt" org-table-cut-region)
("pt" org-table-paste-rectangle)
("t`" org-table-edit-field)
  
    )


;; (evil-define-minor-mode-key 'normal 'lsp-mode (kbd ",") 'hydra-python/body)
;; (evil-define-key 'normal 'org-mode-map (kbd "<SPC> m") 'hydra-python/body)


;; ======= provide =======
(provide 'init-org)
