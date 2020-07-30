;; init file for org-mode

(require 'org)
;;---------bullets------------
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; ------key-map-set-----
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)



;; After that, everything will happen automatically. All diary entries including holidays, anniversaries, etc., will be included in the agenda buffer created by Org mode. <SPC>, <TAB>, and <RET> can be used from the agenda buffer to jump to the diary file in order to edit existing diary entries. The i command to insert new entries for the current date works in the agenda buffer, as well as the commands S, M, and C to display Sunrise/Sunset times, show lunar phases and to convert to other calendars, respectively. c can be used to switch back and forth between calendar and agenda.
(setq org-agenda-include-diary t)

(general-define-key
 :keymaps 'org-mode-map
 "C-j" 'org-next-visible-heading
 "C-k" 'org-previous-visible-heading
 ;; "," 'hydra-org/body
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
("Sm" org-match-sparse-tree)
("So" org-occur)
("Sj" next-error)
("Sk" previous-error)

;; -------drawer--------
("id" org-insert-drawer)

;; -------table--------
("i|" org-table-create-or-convert-from-region)
("tr" org-table-align)
("t<SPC>" org-table-blank-field)
("ct" org-table-copy-region)
("xt" org-table-cut-region)
("pt" org-table-paste-rectangle)
("t`" org-table-edit-field)
  
;; -------link--------
;; you need to use org-store-link
("il" org-insert-link)
("lj" org-next-link)
("lk" org-previous-link)

;; -------tag--------
("it" org-ctrl-c-ctrl-c)
("iT" org-set-tags-command)
("r" org-ctrl-c-ctrl-c)

;; -------property--------

("ip" org-set-property)
("dp" org-delete-property)


;; -------time--------
(".." org-time-stamp)
(".!" org-time-stamp-inactive)
(".c" org-date-from-calendar)
(".C" org-date-goto-calendar)
("o" org-open-at-point)
(".y" org-evaluate-time-range)

;; -------todo--------
("\\t" org-todo)
("\\st" org-show-todo-tree)
;; ("\\l" org-todo-list)
("i\\" org-insert-todo-heading)

;; -------Agenda--------
("ai" org-agenda-file-to-front)
("ad" org-remove-file)
;; org switchb 应该是 global
;; ("a<TAB>" 'org-switchb)
;; ("" 'universal-argument)
("asl" org-agenda-set-restriction-lock)
("arl" org-agenda-remove-restriction-lock)


    )


;; (evil-define-minor-mode-key 'normal 'lsp-mode (kbd ",") 'hydra-python/body)
;; (evil-define-key 'normal 'org-mode-map (kbd "<SPC> m") 'hydra-python/body)


;; ======= provide =======
(provide 'init-org)
