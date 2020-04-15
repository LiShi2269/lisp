




(require 'neotree)
(require 'all-the-icons)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))






(defhydra hydra-neotree()
;;  "

;; hydra-ein

;; _j_: next    _S_: Save   _t_: show      _u_: toggle
;; _k_: pre     _R_: Rename _E_: ExAll     _U_: Toggle
;; _J_: move    _m_: merge  _l_: Clean     _C_: Exe 
;; _K_: Move    _M_: Merge  _L_: CleanAll  _D_: Del
;; _o_: InsBl   _c_: Copy   _Q_: Quit      _O_: InsAbo
;; _O_: InsAbo  _p_: Paste  _/_: Split

;; "

("?\\T" neotree-enter)
("<SPC>" neotree-quick-look)
( "q" neotree-hide)
( "<return>" neotree-enter)
( "r" neotree-refresh)
( "j" neotree-next-line)
( "k" neotree-previous-line)
( "A" neotree-stretch-toggle)
( "H" neotree-hidden-file-toggle)
( "R" neotree-rename-node)
( "C" neotree-create-node)
( "D" neotree-delete-node)
( "c" neotree-copy-node)
( "h" neotree-select-up-node))













(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "j") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "k") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-rename-node)
(evil-define-key 'normal neotree-mode-map (kbd "C") 'neotree-create-node)
(evil-define-key 'normal neotree-mode-map (kbd "D") 'neotree-delete-node)
(evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-copy-node)
(evil-define-key 'normal neotree-mode-map (kbd "h") 'neotree-select-up-node)
(evil-define-key 'normal neotree-mode-map (kbd "?") 'hydra-neotree/body)


;; ======= provide =======
(provide 'neotree_icons)
